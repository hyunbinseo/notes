> [!NOTE]
> [Mount](./smb.md) the Synology NAS share (e.g. `//<ip>/zoom/zoom`) and run commands against it.

## Find

Find recordings matching a glob and all regex patterns.

```bash
find . -type f -name "*.mp4" | grep -E "B28|K52" | grep -E "Recording_[0-9]"
```

## Delete

Delete `as/avo/gallery/gvo` recordings from the read-write mount, only if the plain `Recording_<res>` version exists.

```bash
find ./smb-rw -type f -name "*.mp4" | grep -E "_(as|avo|gallery|gvo)_" |
  while IFS= read -r file; do
    if compgen -G "${file%%_Recording_*}_Recording_[0-9]*.mp4" > /dev/null; then rm -v "$file"; fi
  done
```

## Extract Audio

Run [Delete](#delete) first so each session has one recording left. Then copy a participant's recordings to local disk and extract the audio from the copies without re-encoding.

```bash
mkdir -p ./zoom-mp4 ./zoom-m4a

# Same mount as Delete; copying only reads, so smb-rw is safe
find ./smb-rw -type f -name "*_Recording_*.mp4" |
  grep -F \
    -e "김철수 (대한초)" \
    -e "홍길동 (민국초)" \
    > ./zoom-mp4/paths.txt

xargs -d '\n' -a ./zoom-mp4/paths.txt -I{} cp -n -v {} ./zoom-mp4/

for file in ./zoom-mp4/*.mp4; do
  base=$(basename "$file")
  ffmpeg -n -i "$file" -vn -c:a copy "./zoom-m4a/${base%.mp4}.m4a"
done

croc send ./zoom-m4a
```
