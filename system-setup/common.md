## Install

### Apps

- https://github.com/imsyy/yt-dlp-gui
- https://github.com/sourcegit-scm/sourcegit

### Fonts

- https://goorm-sans.goorm.io/
- https://elice.io/ko/resources/brand
- https://github.com/orioncactus/pretendard
- https://github.com/sun-typeface/SUIT/releases

## Setup

### GitHub CLI

```bash
gh auth login
gh auth setup-git # https://cli.github.com/manual/gh_auth_setup-git
gh auth switch
```

### Git

```bash
git config --global core.autocrlf false
git config --global core.eol lf

git add --renormalize . # for existing repositories in CRLF
```

```bash
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global push.followTags true

# gh does not set git user information
# See https://github.com/cli/cli/issues/6096
git config --global user.name "Your Name" # Hyunbin Seo
git config --global user.email "you@example.com" # See https://github.com/settings/emails
```

```bash
git clone https://alice@github.com/mona/test
# If you want to always use the alice account for the mona/test GitHub repository
# See https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/multiple-users
```

### Firefox

```plaintext
about:config / browser.tabs.dragDrop.createGroup.delayMS
```
