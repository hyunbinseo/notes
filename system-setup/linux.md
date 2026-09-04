OS-independent common setup lives in [`common.md`](./common.md).

## Bottles

### fcitx5 IME 설정

```shell
# Bottles 전역
flatpak override --user \
  --env=XMODIFIERS=@im=fcitx \
  --env=GTK_IM_MODULE=fcitx \
  --env=QT_IM_MODULE=fcitx \
  com.usebottles.bottles
```

```ini
# 개별 Bottle (설정 / 호환성 / 환경 변수)
XMODIFIERS=@im=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
```

### 한글 기본 폰트 추가

맑은고딕 파일을 추가할 것. (설정 / Quick actions / Browse `C:/` drive)

```plaintext
/drive_c/windows/Fonts/malgun.ttf
```

### PC 카카오톡

Bottles v67.1 기준:

- 설정 / 구성 요소 / 실행기: Built-in Wine 11.0
- 설정 / 디스플레이 / 고급 디스플레이 설정 / Screen Scaling 값을 165로 설정해도 '시스템 기본 배율 (150%)'로 표시되고 적용됨

설정 후 확인할 것:

- 터치패드 제스처로 스크롤이 되는지
- 한글 입력이 되는지

안 되면 Wayland (Experimental) 활성화 등 설정을 변경할 것.
