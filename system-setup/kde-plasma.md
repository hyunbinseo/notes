Fedora-specific setup lives in [`fedora.md`](./fedora.md).

```bash
kinfo
# Operating System: Fedora Linux 44
# KDE Plasma Version: 6.7.4
# KDE Frameworks Version: 6.28.0
# Qt Version: 6.11.1
# Kernel Version: 7.1.6-201.fc44.x86_64 (64-bit)
# Graphics Platform: Wayland
```

## Panel (Taskbar)

### 시스템 트레이 설정

일반 / 항목 / 전원과 배터리 / 항상 표시

### Minimize All Windows

See https://www.reddit.com/r/kde/comments/5sel7m/comment/n8t1qe6

'바탕화면 엿보기'가 기본값이나 '모든 창 최소화'로 작동하도록 변경할 수 있음

모든 창 최소화 설정 / 키보드 단축키 / 클릭한 것처럼 위젯 활성화: `Meta + D`

## Touchpad Gestures

Enabled by default. Not customizable. See https://kde.org/ko/announcements/plasma/5/5.25.0/

## Konsole

`Ctrl + Alt + 0` resets the zoom level

## KRunner

See https://www.reddit.com/r/kde/comments/v9snu6/comment/ne5anfl

> I just managed it. For some reason some (but not all) applications do have a `.desktop` file in `~/.local/share/applications/`, while some others don't. I can only guess that their \*`.desktop` file is in some other path, but not in the home directory, because I can't find them there with FSearch.
>
> So move the \*`.desktop` file in `~/.local/share/applications/` of the applications that appear twice in KRunner to some other path. Then check if it still appears multiple times in the KRunner menu. If it only appears once, start it to make sure it's working. Then you can safely remove the `*.desktop` file that you just moved.
