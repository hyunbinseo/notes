#!/usr/bin/env bash
set -euo pipefail

# Set up a Samba share on Fedora
# path:      /home/hyunbinseo/zoom
# user:      hyunbinseo
# reachable: Tailscale peers only

# --- Prerequisites ---
ip link show tailscale0 &> /dev/null ||
  { echo "Interface 'tailscale0' not found — is Tailscale installed and running?" >&2; exit 1; }

# --- 1. Install Samba ---
sudo dnf install -y samba samba-common samba-client policycoreutils-python-utils

# --- 2. Linux permissions ---
sudo mkdir -p /home/hyunbinseo/zoom
sudo chown hyunbinseo:hyunbinseo /home/hyunbinseo/zoom

# smbd acts as the hyunbinseo UID; no ACL needed.
sudo chmod 700 /home/hyunbinseo
sudo chmod -R 700 /home/hyunbinseo/zoom

# --- 3. Samba account ---
sudo smbpasswd -a hyunbinseo # separate password from login, prompted interactively

# --- 4. Overwrite smb.conf ---
[ -f /etc/samba/smb.conf.backup ] || sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

sudo tee /etc/samba/smb.conf > /dev/null <<'EOF'
[global]
	workgroup = WORKGROUP
	server string = Samba Server
	security = user
	map to guest = never
	server min protocol = SMB2_10
	smb encrypt = required

[zoom]
	comment = Zoom Recordings
	path = /home/hyunbinseo/zoom
	browsable = yes
	writable = yes
	guest ok = no
	valid users = hyunbinseo
	create mask = 0600
	directory mask = 0700
EOF

sudo testparm

# --- 5. SELinux context ---
# On rerun, -a detects the existing mapping and modifies it in place (exit 0)
sudo semanage fcontext -a -t samba_share_t "/home/hyunbinseo/zoom(/.*)?" &> /dev/null
sudo restorecon -Rv /home/hyunbinseo/zoom
sudo setsebool -P samba_enable_home_dirs on

# --- 6. Firewall ---
sudo firewall-cmd --permanent --zone=internal --change-interface=tailscale0
sudo firewall-cmd --permanent --zone=internal --add-service=samba

# --- 7. Start services ---
sudo firewall-cmd --reload
sudo systemctl enable --now smb nmb
