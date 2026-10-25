Mount an SMB share as a local directory. Omitting `password=` prompts for it.

```bash
# Read-only
mkdir -p ./smb-ro
sudo mount -t cifs "//<ip>/<share>" ./smb-ro -o username=<user>,ro
```

```bash
# Read-write
mkdir -p ./smb-rw
# uid/gid allow edits and deletes without sudo
sudo mount -t cifs "//<ip>/<share>" ./smb-rw -o username=<user>,uid=$(id -u),gid=$(id -g)
```

```bash
sudo umount <dir>
```

To skip the prompt, store the credentials in a file and pass `credentials=` instead of `username=`.

```ini
# ~/.smbcredentials
username=<user>
password=<password>
```

```bash
chmod 600 ~/.smbcredentials
sudo mount -t cifs "//<ip>/<share>" ./smb-ro -o credentials="$HOME/.smbcredentials",ro
```
