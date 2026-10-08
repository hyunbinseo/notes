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

(Optional) Inline credentials in the config file:

> [!WARNING]
> Imported configs are stored unencrypted in `/var/lib/openvpn3/configs/`.

```diff
-auth-user-pass
+<auth-user-pass>
+username
+password
+</auth-user-pass>
```

Then import and connect:

```bash
openvpn3 config-import --config ./config.ovpn --name nord --persistent
rm ./config.ovpn # if credentials were inlined

openvpn3 session-start --config nord # check for 'Connected to'
openvpn3 sessions-list
openvpn3 session-manage --config nord --disconnect
```
