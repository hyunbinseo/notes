- OS-independent common setup lives in [`common.md`](./common.md).
- Distro-agnostic Linux setup lives in [`linux.md`](./linux.md).
- KDE Plasma desktop tweaks live in [`kde-plasma.md`](./kde-plasma.md).

```bash
cat /etc/os-release
# NAME="Fedora Linux"
# VERSION="44 (KDE Plasma Desktop Edition)"
# RELEASE_TYPE=stable
# ID=fedora
# VERSION_ID=44
# VERSION_CODENAME=""
# PRETTY_NAME="Fedora Linux 44 (KDE Plasma Desktop Edition)"
```

## Fix Incorrect Time

```bash
# See https://discussion.fedoraproject.org/t/147640
timedatectl status
timedatectl set-local-rtc 0
```

## Enable Auto Update

See https://docs.rockylinux.org/10/guides/security/dnf_automatic/

```bash
sudo dnf install -y dnf-automatic

sudo tee /etc/dnf/automatic.conf <<'EOF'
[commands]
apply_updates = yes
EOF

sudo systemctl enable --now dnf-automatic.timer
```

## Enable Flathub

See https://flathub.org/setup/Fedora

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

> [!WARNING]
> Install these apps via `dnf` — Flatpak sandboxing causes issues.

```bash
# See https://code.visualstudio.com/docs/setup/linux
sudo dnf install -y code # or code-insiders

# See https://docs.fedoraproject.org/en-US/quick-docs/installing-chromium-or-google-chrome-browsers/
sudo dnf install -y google-chrome-stable
```

## Setup Tailscale

See https://tailscale.com/kb/1130/install-fedora

```bash
sudo dnf install -y tailscale
sudo systemctl enable --now tailscaled
sudo tailscale up
# sudo tailscale set --ssh
```

## Setup Zsh

```bash
# See https://wiki.archlinux.org/title/Command-line_shell
sudo dnf install -y zsh
chsh -l
chsh -s /bin/zsh
```

- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/zsh-users/zsh-autosuggestions

```bash
# Path if installed via the dnf package
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

## Replace Korean IME

```bash
sudo dnf install -y fcitx5 fcitx5-hangul
# KDE / 시스템 설정 / 키보드 / 가상 키보드 / Fcitx 5 선택 후 적용
```

## Remap Keys

e.g. F12 as HOME on HP EliteBook X G1i

```bash
sudo dnf copr enable -y alternateved/keyd
sudo dnf install -y keyd
sudo systemctl enable keyd --now
sudo nano /etc/keyd/default.conf # See https://github.com/rvaiya/keyd
```

## Connect WWAN

```bash
mmcli -L
# /org/freedesktop/ModemManager1/Modem/0 [mtk] MBIM [14C3:4D75]

mmcli -m 0
#  -----------------------------------
#  General   |                   path: /org/freedesktop/ModemManager1/Modem/0
#  -----------------------------------
#  Hardware  |           manufacturer: mtk
#            |                  model: MBIM [14C3:4D75]
#  -----------------------------------
#  System    |                drivers: mtk_t7xx
#            |                 plugin: mtk
#            |           primary port: wwan0mbim0
#            |                  ports: wwan0 (net), wwan0at0 (at), wwan0mbim0 (mbim)
#  -----------------------------------
#  Status    |                   lock: sim-pin2
#            |         unlock retries: sim-pin (3), sim-puk (10), sim-pin2 (3), sim-puk2 (10)
#            |                  state: registered
#            |            power state: on
#            |            access tech: lte
#            |         signal quality: 83% (recent)
#  -----------------------------------
#  SIM       |       primary sim path: /org/freedesktop/ModemManager1/SIM/0
#            |         sim slot paths: slot 1: /org/freedesktop/ModemManager1/SIM/0 (active)
#            |                         slot 2: /org/freedesktop/ModemManager1/SIM/1
#  -----------------------------------
#  Bearer    |                  paths: /org/freedesktop/ModemManager1/Bearer/1

nmcli connection add type gsm ifname wwan0mbim0 con-name "SKT-LTE" apn "lte.sktelecom.com" connection.metered yes user "" password ""
# 'SKT-LTE' 연결이 성공적으로 추가되었습니다.
```
