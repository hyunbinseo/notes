```bash
sudo dnf install ghostscript
```

Compress a PDF file. See this [article](https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux#basic-ghostscript-compression-command).

```bash
gs \
  -sDEVICE=pdfwrite \
  -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS=/ebook \
  -dNOPAUSE \
  -dQUIET \
  -dBATCH \
  -sOutputFile=output.pdf \
  input.pdf
```
