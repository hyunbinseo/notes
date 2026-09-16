OS-independent common setup lives in [`common.md`](./common.md).

## Firmware Update

```bash
fwupdmgr update
```

## Read SMS (ModemManager)

```bash
mmcli -L
# /org/freedesktop/ModemManager1/Modem/16 [mtk] MBIM [14C3:4D75]

mmcli -m 16 --messaging-list-sms | head -n 3 | grep -oP '(?<=SMS/)\d+' | while read -r id; do mmcli -s "$id"; done
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
```

PC 카카오톡 내 설정을 변경한다:

- 화면 / 기본 / 화면 배율: 200% (글씨체: Pretendard)
- 채팅 / 다운로드 폴더: `/home` 디렉터리 직접 사용 가능

```plaintext
C:\users\<username>\Downloads  # 설정에선 이렇게 표시되지만
/home/<username>/다운로드/       # 실제로는 여기에 저장된다
```
