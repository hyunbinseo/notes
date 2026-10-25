#!/usr/bin/env bash
set -euo pipefail

# Share a directory in your home over Samba on Fedora, to Tailscale peers only

[ "$EUID" -ne 0 ] ||
  { echo "Run as a regular user, not root or with sudo" >&2; exit 1; }

SHARE_USER=$USER
SHARE_HOME=$HOME

SHARE_NAME=zoom
SHARE_PATH="$SHARE_HOME/$SHARE_NAME"

# --- Prerequisites ---
ip link show tailscale0 &> /dev/null ||
  { echo "Interface 'tailscale0' not found — is Tailscale installed and running?" >&2; exit 1; }

# --- 1. Install Samba ---
sudo dnf install -y samba samba-common samba-client policycoreutils-python-utils

# --- 2. Linux permissions ---
mkdir -p "$SHARE_PATH"

# smbd acts as your UID; no ACL needed.
sudo chmod 700 "$SHARE_HOME"
sudo chmod -R 700 "$SHARE_PATH"

# --- 3. Samba account ---
echo "Set a Samba password for '$SHARE_USER' (separate from the login password):"
sudo smbpasswd -a "$SHARE_USER"

# --- 4. Overwrite smb.conf ---
[ -f /etc/samba/smb.conf.backup ] || sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

# Unquoted heredoc: variables expand, so escape any literal $ or backtick
sudo tee /etc/samba/smb.conf > /dev/null <<EOF
[global]
	workgroup = WORKGROUP
	server string = Samba Server
	security = user
	map to guest = never
	server min protocol = SMB2_10
	smb encrypt = required

[$SHARE_NAME]
	path = $SHARE_PATH
	browsable = yes
	writable = yes
	guest ok = no
	valid users = $SHARE_USER
	create mask = 0600
	directory mask = 0700
EOF

sudo testparm -s

# --- 5. SELinux context ---
# On rerun, -a detects the existing mapping and modifies it in place (exit 0)
sudo semanage fcontext -a -t samba_share_t "$SHARE_PATH(/.*)?" &> /dev/null
sudo restorecon -Rv "$SHARE_PATH"
sudo setsebool -P samba_enable_home_dirs on

# --- 6. Firewall ---
sudo firewall-cmd --permanent --zone=internal --change-interface=tailscale0
sudo firewall-cmd --permanent --zone=internal --add-service=samba

# --- 7. Start services ---
sudo firewall-cmd --reload
sudo systemctl enable --now smb nmb
