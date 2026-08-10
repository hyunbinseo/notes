OS-independent common setup lives in [`common.md`](./common.md).

## Setup PowerShell

```powershell
winget install --id Microsoft.WindowsTerminal
winget install --id Microsoft.PowerShell
```

```plaintext
터미널 / 시작 / 기본 프로필 / PowerShell
터미널 / 설정 / PowerShell / 시작 디렉터리 / .
```

```powershell
# See https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_profiles
if (-not (Test-Path $profile)) { New-Item $profile -Force }
Invoke-Item $profile
```

```powershell
# Environment variables for the profile
$env:CLAUDE_CODE_USE_POWERSHELL_TOOL = "1"
```

## Install Packages

### Manual

- https://pnpm.io/installation#on-windows
- https://code.claude.com/docs/en/quickstart#step-1-install-claude-code

### winget

```powershell
$packages = @(
	# 'astral-sh.uv',
	# 'Balena.Etcher',
	# 'ch.LosslessCut',
	# 'GitHub.GitHubDesktop',
	# 'Greenshot.Greenshot',
	# 'Mozilla.Firefox', - https://github.com/microsoft/winget-pkgs/issues/207783
	# 'Mozilla.Thunderbird',
	# 'mpv.net',
	# 'pnpm.pnpm', - https://github.com/pnpm/pnpm/issues/7293
	# 'Schniz.fnm',
	# 'Stacher.youtube-dl',
	# 'SublimeHQ.SublimeMerge',
	# 'Yubico.Authenticator',

	'9P1XD8ZQJ7JD', # fre:ac
	'AdGuard.AdGuard',
	'AdrienAllard.FileConverter',
	'Axosoft.GitKraken',
	'Bitwarden.Bitwarden',
	'ClockworkMod.UniversalADBDriver',
	'Dropbox.Dropbox',
	'Git.Git',
	'GitHub.cli',
	'Google.Chrome',
	'Google.GoogleDrive',
	'Gyan.FFmpeg',
	'ImageMagick.ImageMagick',
	'Kakao.KakaoTalk',
	'KDE.KDEConnect',
	'LocalSend.LocalSend',
	'M2Team.NanaZip',
	'Microsoft.PowerToys',
	'OBSProject.OBSStudio',
	'okibcn.nano',
	'schollz.croc',
	'Sinew.Enpass',
	'SQLite.SQLite',
	'Stacher.Stacher',
	'tailscale.tailscale',
	'Telegram.TelegramDesktop',
	'ZedIndustries.Zed',
	'Zoom.Zoom'

	# Last item should not have trailing comma
)

foreach ($package in $packages) {
	Write-Host "Installing $package..."
	winget install --id $package --silent --accept-package-agreements --accept-source-agreements
}

winget install --id Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'
# winget install -e --id=Microsoft.VisualStudioCode.Insiders --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'
```

## Remove Bloatware

```powershell
# Logitech
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Logitech Download Assistant"
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "LogiOptionsPlus"

# Razer
Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Tracing\RazerInstaller_RASAPI32" -Name "Start" -Value 4 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Tracing\RazerInstaller_RASMANCS" -Name "Start" -Value 4 -Type DWord
```
