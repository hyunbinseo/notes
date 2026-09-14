OS-independent common setup lives in [`common.md`](./common.md).

## Firmware Update

```bash
fwupdmgr update
```

## 카카오톡 설치

```bash
sudo dnf install wine

wine --version
# wine-11.0 (Staging)

winecfg # 그래픽 / 화면 해상도: 158 dpi
# kscreen-doctor -o 기준
# eDP-1 Scale: 1.65
# 96 * 1.65 = 158

wine KakaoTalk_Setup.exe # 64-bit 설치 파일

# 카카오톡 설정 / 화면 / 기본
# - 화면 배율: 200%
# - 글씨체: Pretendard
```
