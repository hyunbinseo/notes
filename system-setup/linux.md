OS-independent common setup lives in [`common.md`](./common.md).

## Bottles

Browse `C:/` drive 버튼 사용해서 맑은고딕 폰트 파일 추가할 것:

```plaintext
/drive_c/windows/Fonts/malgun.ttf
```

### PC 카카오톡

Bottles v67.1 기준:

- 구성 요소 / 실행기: Built-in Wine 11.0
- Screen Scaling 값을 165로 설정해도 '시스템 기본 배율 (150%)'로 표시되고 적용됨

설정 후 확인할 것:

- 터치패드 제스처로 스크롤이 되는지
- 한글 입력이 되는지

안 되면 Wayland (Experimental) 활성화 등 설정을 변경할 것
