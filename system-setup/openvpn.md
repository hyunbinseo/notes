A NordVPN provided OpenVPN configuration file (`*.ovpn`) works with the `openvpn` CLI:

```shell
sudo openvpn --config ./config.ovpn --auth-user-pass ./pass.txt
```

```plaintext
OpenVPN 2.7.6 x86_64-redhat-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] [DCO]
library versions: OpenSSL 3.5.8 25 Aug 2026, LZO 2.10
DCO version: 7.1.12-200.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Fri Aug 28 14:00:18 UTC 2026
```

…but fails to connect in these:

- ipTime 아이피타임 공유기 `15.36.6`
- OpenVPN Connect `3.9.0 (5008)`

Unlike ipTime's `연결 실패`, OpenVPN Connect shows a specific error:

> Your connection configuration contains unsupported options. Contact your Server Admin for more info.
>
> - 'ping-timer-rem',
> - 'resolv-retry',
> - 'explicit-exit-notify'

Commenting out these options fixed both ipTime and OpenVPN Connect:

```ini
client
dev tun
proto tcp
remote <ipv4>
# resolv-retry infinite
nobind
# ping-timer-rem
reneg-sec 0
# explicit-exit-notify
verify-x509-name CN=<hostname>
```
