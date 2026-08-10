OS-independent common setup lives in [`common.md`](./common.md).

## Bottles

Browse `C:/` drive 버튼 사용해서 맑은고딕 폰트 파일 추가할 것:

```plaintext
/drive_c/windows/Fonts/malgun.ttf
```

### 카카오톡

Bottle / 옵션 / 설정(병 설정 구성) 메뉴 안에서 다음과 같이 설정:

- 구성 요소 / 실행기: Built-in Wine 11.0
- 디스플레이 / Wayland (Experimental) 활성화
- 디스플레이 / 고급 디스플레이 설정 / Screen Scaling: 165

Wayland 활성화 시 한글 입력은 잘 되나, 터치패드 두 손가락 스크롤이 작동하지 않음
