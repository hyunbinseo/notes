# Compress PDF (Ghostscript)
# compress-pdf input.pdf # output: input-compressed.pdf
compress-pdf() {
	local input="$1"
	[[ ${input:l} == *.pdf ]] || { echo "usage: compress-pdf input.pdf" >&2; return 1; }
	[[ -f $input ]] || { echo "compress-pdf: $input not found" >&2; return 1; }
	local output="${input:r}-compressed.pdf"
	[[ ! -e $output ]] || { echo "compress-pdf: $output already exists" >&2; return 1; }
	# gs reads a leading | as a pipe to a command
	[[ $output == /* ]] || output="./$output"
	# escape %, which gs reads as a page number format
	local gs_output="${output//\%/%%}"
	local ok=0
	{
		gs \
			-sDEVICE=pdfwrite \
			-dPDFSETTINGS=/ebook \
			-dNOPAUSE \
			-dQUIET \
			-dBATCH \
			-sOutputFile="$gs_output" \
			-f"$input" &&
			ok=1
	} always {
		(( ok )) || rm -f -- "$output"
	}
}

# Read SMS (ModemManager)
# read-sms 10
read-sms() {
	local count="$1"
	[[ $count =~ ^[1-9][0-9]*$ ]] || { echo "usage: read-sms count" >&2; return 1; }
	setopt local_options pipe_fail
	mmcli -m any --messaging-list-sms | grep -oP '(?<=SMS/)\d+' | sort -rn | head -n "$count" | while read -r id; do mmcli -s "$id"; done
}

# Tint terminal on SSH
# Tested with zsh 5.9:
# - Konsole 26.08.1: works
# - Zed 1.21.0: no effect
ssh() {
	# skip non-interactive use, e.g. ssh host cmd | less
	[[ -t 0 && -t 1 ]] || { command ssh "$@"; return; }
	# use dark red background
	printf '\e]11;#2a0a0a\a' > /dev/tty
	{
		command ssh "$@"
	} always {
		# reset to profile background
		printf '\e]111\a' > /dev/tty
	}
}
