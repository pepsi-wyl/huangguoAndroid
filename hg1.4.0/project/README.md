# 黄果 Android 1.4.0 反编译工程

沿用本仓库 1.2.0 的独立版本结构。原包版本为 1.4.0 / 140，包名 `com.njggc.yjusza`；调试包为 `com.njggc.yjusza.debug`，可与原版和 1.2.0 调试包并存。

## 构建与运行

Android Studio 直接打开本文件所在的 `project/`。使用 JDK 17 或兼容版本、SDK Platform 34、Build Tools 36.0.0；原包只提供 ARM64 原生库，运行需 ARM64 设备或模拟器。在本机 `local.properties` 配置 `sdk.dir`，然后在工程目录执行：

```bash
./gradlew :app:verifyManifestTransform assembleDebug
python3 tools/verify_apk.py
adb install -r app/build/outputs/apk/debug/hgdj-debug.apk
adb shell am start -W -n com.njggc.yjusza.debug/com.org.aksm.MainActivity
```

Gradle 依赖已缓存时可加 `--offline`。Windows 使用 `gradlew.bat`。验证脚本需要 Python 3.9+，可通过 `--sdk` 指定 SDK。

从 Release 下载的单版本工程 ZIP 不含原始 APK。另行下载原包后执行：

```bash
python3 tools/verify_apk.py --original /path/to/huangguo-1.4.0-original.apk
```

最终 APK 位于 `app/build/outputs/apk/debug/hgdj-debug.apk`；Android Studio 的 `app` 运行配置也部署此重打包产物。

## 修改位置与还原边界

| 位置 | 用途 |
| --- | --- |
| `apktool/` | 实际构建输入：Smali、资源、assets 和原生库 |
| `reference/` | Java 参考代码和资源，不参与编译 |
| `app/src/main/` | IDE 识别入口的占位代码，不是实际业务实现 |
| `app/build.gradle` | 重打包、Manifest 属性修改、对齐及签名 |
| `provenance.json` | 原包身份、工具版本和已知反编译错误 |
| `tools/verify_apk.py` | 可重复运行的基线 APK 验证 |

Flutter 业务位于原始 `lib/arm64-v8a/libapp.so`；保留编译库并不等于恢复 Dart 源码，不支持 Flutter 热重载。Android 逻辑修改应针对 `apktool/` 中的 Smali，不能通过修改占位 Activity 改变应用业务。

源清单保留原包内容。构建仅在临时副本中切换包名及关联属性、修改标签，并设置 `debuggable` 和 `extractNativeLibs`；XML 属性赋值可覆盖已有值。回归任务检查原属性不存在、为 false、为 true 以及重复转换的情况。

## 反编译记录

原始 APK 文件名、SHA-256、工具版本及出错文件清单以 `provenance.json` 为准。初始解码使用 Apktool 2.12.1，参考源码使用 JADX 1.5.3。以下命令从 `project/` 执行，输出到本地隔离目录，不覆盖维护中的解码文件：

```bash
mkdir -p .generated/redecode
java -jar tools/apktool.jar d ../original/hgdj_1.4.0_260923_3.apk \
  -o .generated/redecode/apktool -p tools/framework
jadx -j 6 --show-bad-code -d .generated/redecode/reference \
  ../original/hgdj_1.4.0_260923_3.apk
```

再次执行前使用新的输出目录。JADX 需单独安装；首次运行报告 7 处还原错误，涉及 5 个参考 Java 文件。这些代码不参与 Smali 重打包，不影响现有构建，但不能当作完整、可编译的原始 Java 源码。

## 验证与签名

`tools/verify_apk.py` 检查原包 SHA-256、assets 和原生库逐字节一致性、调试包名和版本、debuggable 标记、APK 签名和对齐。退出码 0 表示全部通过，失败返回 1。此脚本用于未修改业务资源的基线；主动修改 assets 或原生库后会报告差异。

运行结果、工具日志和截图均放在被 Git 忽略的 `verification/`，发布脚本也拒绝打包误提交的该目录。报告中的调试 APK 哈希只识别本次本地构建，不能用于验证其他人的构建：每位维护者首次构建会生成独立调试密钥。

密钥保存在 `.generated/debug-signing/debug.keystore`，后续构建复用。密码为 `android`，别名 `androiddebugkey`；删除后重新生成会改变签名。密钥、本地 SDK 路径、日志和构建缓存均不入库。

初始版本已于 2026-09-24 完成 ARM64 模拟器安装与冷启动验证，显示启动页面，检查时 crash 缓冲区为空。完整性脚本不会安装应用或验证业务；登录、支付、播放等线上功能尚未验证，独立包名及签名可能影响这些功能。

## 提交与打包

提交前完成构建、完整性验证及必要的设备启动检查。在仓库根目录运行：

```bash
python3 -m unittest discover -s scripts -p 'test_*.py'
```

确认 `git status` 中没有密钥、缓存或验证产物。提交后按根 README 的流程运行 `python3 scripts/package_release.py hg1.4.0 --ref HEAD` 预览工程包；该脚本只读取已提交内容。原 APK、工具版本及参考代码必须随版本目录保留。
