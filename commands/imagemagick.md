```bash
sudo dnf install imagemagick
```

```bash
magick mogrify -format avif *.png
```

```bash
for img in *.jpg *.png; do
  magick "$img" -quality 80 "${img%.*}_$(magick identify -format "%wx%h" "$img").avif"
done
```
