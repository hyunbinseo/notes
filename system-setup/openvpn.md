## Fix Unsupported Options

A NordVPN-provided OpenVPN configuration file (`*.ovpn`) works with `openvpn` 2.x, but fails to connect with:

- OpenVPN 3 Linux Client `v27.1` (`openvpn3`)
- OpenVPN Connect `3.9.0 (5008)`
- ipTime 아이피타임 공유기 `15.36.6` (연결 실패)

OpenVPN 3 Linux Client shows:

```plaintext
Connection failed: UNKNOWN/UNSUPPORTED OPTIONS: ping-timer-rem
Unsupported option (ignored): resolv-retry,explicit-exit-notify
```

OpenVPN Connect shows:

> Your connection configuration contains unsupported options. Contact your Server Admin for more info.
>
> - 'ping-timer-rem',
> - 'resolv-retry',
> - 'explicit-exit-notify'

Commenting out these options fixed all cases:

```ini
# resolv-retry infinite
# ping-timer-rem
# explicit-exit-notify
```

## Connect on Linux

OpenVPN 2 is packaged as `openvpn`, separate from the OpenVPN 3 Linux client. Installing the NetworkManager plugin pulls it in:

```bash
sudo dnf install NetworkManager-openvpn
```

Import the config, then store the credentials as a connection secret:

```bash
nmcli connection import type openvpn file ./config.ovpn
# The connection name is derived from the file name (e.g. nord)

nmcli connection modify nord vpn.user-name 'username'
nmcli connection modify nord vpn.secrets 'password=password'

# Username/password only, with no client certificate
nmcli connection modify nord +vpn.data 'connection-type=password'

nmcli connection up nord
nmcli connection down nord
```

Skipping `connection-type=password` leaves the imported connection as `tls`, and activation fails with:

```plaintext
Options error: No client-side authentication method is specified. You must use either --cert/--key, --pkcs12, or --auth-user-pass
```
