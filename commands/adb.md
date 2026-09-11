> [!NOTE]
> On Windows, the installer doesn't add `adb` to PATH. `cd` into its install directory and run `./adb` instead.

```bash
winget install --id ClockworkMod.UniversalADBDriver
cd "C:\Program Files (x86)\ClockworkMod\Universal Adb Driver"
./adb devices
```

Disable Samsung Galaxy camera's shutter sound.

```bash
adb shell settings put system csc_pref_camera_forced_shuttersound_key 0
```
