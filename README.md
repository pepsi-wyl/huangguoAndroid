# huangguoAndroid

按黄果 APP 原始 APK 的版本维护，每个版本包含原始 APK 和独立可构建、可运行的反编译工程。当前版本为 `1.2.0`（versionCode `120`）。

本仓库用于授权范围内的学习研究、兼容性分析和调试，不是黄果 APP 的原始开发源码仓库，不应被视为官方发布渠道。

## 目录与版本维护

```text
huangguoAndroid/
├── hg1.2.0/
│   ├── original/                 # 原始 APK
│   └── project/                  # Android Studio 打开此目录
│       ├── app/                  # 重打包和调试工程
│       ├── apktool/              # 资源与 Smali 文件
│       ├── reference/            # Java 参考源码及资源
│       ├── tools/                # 重打包工具
│       ├── gradle/
│       └── gradlew
├── AGENTS.md
└── README.md
```

新增版本时创建 `hg<versionName>/original/` 和 `hg<versionName>/project/`，例如 `hg1.3.0/`，保留旧版本。版本号以 APK 的实际 `versionName` 为准。

## 下载与发布

在 GitHub 仓库的 **Releases** 中选择对应版本，分别下载 `huangguo-1.2.0-original.apk` 和 `huangguo-1.2.0-project.zip`。工程包解压后打开 `hg1.2.0/project/`；GitHub 自动附带的 `Source code (zip)` 包含整个仓库，并非单版本工程包。

每次发布包含原始 APK、单版本工程 ZIP 和 `SHA256SUMS.txt`。工程包附带本 README，只从指定 Git 提交读取文件，不包含未提交文件、其他版本及本地构建缓存。此自动化负责打包，不执行 Android 构建或设备运行验证；发版前请先按下文验证构建。

维护者在提交当前版本后，可使用 Python 3.9+ 和 Git 本地预览打包：

```bash
python3 scripts/package_release.py hg1.2.0 --ref HEAD
```

输出到 `dist/hg1.2.0/`，不会覆盖已有输出。再次预览可使用 `--output /tmp/huangguo-preview-2` 指定新目录。正式按标签重现打包时省略 `--ref HEAD`，脚本会读取同名标签。

配置 GitHub 远程仓库后，提交并推送代码，再推送发布标签：

```bash
git push origin HEAD
git tag -a hg1.2.0 -m '黄果 Android 1.2.0'
git push origin hg1.2.0
```

推送 `hg*` 标签会触发 `.github/workflows/release.yml`，自动上传附件并创建 **Release 草稿**，检查附件后在 GitHub 点击发布，用户才能下载。工作流使用 GitHub 自带的 `GITHUB_TOKEN`，无需配置个人令牌；仓库策略须允许该工作流写入 Releases。若同名 Release 已存在，流程会失败而不会覆盖它；部分失败留下的草稿需先检查并补齐，或删除该草稿后重新运行失败的工作流。

标签必须为 `hg<三段版本号>` 或 `hg<三段版本号>-r<正整数>`。例如 `hg1.2.0-r2` 从 `hg1.2.0/` 打包，表示 APK 版本不变、工程修订发布；附件名称相应带 `1.2.0-r2`。每个版本的 `original/` 必须恰好有一个已提交的 APK，且标签版本须与工程 `apktool.yml` 中的版本一致。新 APK 版本新增目录，不移动旧发布标签。

下载全部附件后，可校验文件完整性：

```bash
shasum -a 256 -c SHA256SUMS.txt  # macOS
# Linux: sha256sum -c SHA256SUMS.txt
```

## 构建

Android Studio 打开 `hg1.2.0/project/`，配置 JDK 17 或兼容版本、Android SDK Platform 34 和 Build Tools 36.0.0。由 IDE 生成本地 `local.properties`，或自行设置 `sdk.dir`。在仓库根目录执行：

```bash
cd hg1.2.0/project
./gradlew assembleDebug
```

重打包产物位于 `project/app/build/outputs/apk/debug/hgdj-debug.apk`（相对于版本目录）。也可在 Android Studio 中选择 `app` 运行到设备。调试包使用独立包名 `tv.ewtcs.dfynfj.debug`。

## 调试签名

首次构建时，Gradle 会调用当前 JDK 的 `keytool` 自动生成项目专用调试密钥。密钥保存在工程本地的 `.generated/debug-signing/debug.keystore`，该目录已被 Git 忽略，不会进入仓库或发布包。后续构建会复用该密钥；删除 `.generated/` 后，下次构建将生成新密钥，届时需要卸载设备上使用旧密钥签名的调试包才能安装。

| 项目 | 值 |
| --- | --- |
| 本地生成位置 | `hg1.2.0/project/.generated/debug-signing/debug.keystore` |
| 密钥库格式 | `PKCS12` |
| 密钥库密码（storePassword） | `android` |
| 密钥别名（keyAlias） | `androiddebugkey` |
| 私钥密码（keyPassword） | `android` |
| 证书主体 / 签发者 | `CN=APK Debug, O=Local Development, C=CN` |
| 有效期 | 从生成时间起 `10000` 天 |
| 公钥 / 签名算法 | `RSA 2048` / `SHA256withRSA` |

密码是公开的固定测试密码，但私钥由每位使用者在本地独立生成。该签名只用于本地调试，不能证明构建来自仓库维护者；请勿将其用于生产发布、重要服务的身份认证或其他项目。

在仓库根目录执行以下命令可查看证书信息：

```bash
keytool -list -v \
  -keystore hg1.2.0/project/.generated/debug-signing/debug.keystore \
  -alias androiddebugkey \
  -storepass android
```

## 调试与使用限制

- `reference/` 是反编译参考代码，可能存在混淆、缺失或还原错误；当前构建流程基于 `apktool/` 中的资源和 Smali 重打包，不会将参考 Java 源码重新编译为完整应用。
- 调试包使用调试签名和独立包名，行为可能与原始 APK 不同。构建成功不代表登录、支付、签名校验或其他线上功能均可用。
- 调试签名仅用于本地测试，不应作为生产签名使用。建议在隔离的测试设备或模拟器上运行，避免使用真实账号或敏感数据。
- 应用可能仍会连接原有线上服务。运行调试包不代表获准访问、测试或修改这些服务；涉及真实业务的操作应先取得相应授权。

## 免责声明与版权说明

### 使用范围

本项目仅面向取得必要授权后的学习研究、安全分析、兼容性验证和调试。使用者应遵守适用法律法规、相关服务条款及授权范围，不得利用本项目实施未经授权的访问、数据获取、付费限制绕过或其他侵害第三方权益的行为。

### 权利归属与分发

黄果 APP 的名称、商标、原始 APK、代码、图片、音视频及其他资源的相关权利归各自权利人所有。第三方组件继续受其原有许可证及声明约束，应保留相应版权与许可信息。

仓库中包含某项内容，不表示维护者拥有其全部权利，也不表示权利人认可或授权本项目。本 README 不授予对原始 APK、反编译代码或资源的复制、修改、商业使用或再分发许可。公开上传、镜像或分发前，应确认具有相应权限；学习研究用途和免责声明均不能替代授权。

### 质量与责任范围

本项目按现状提供，不对反编译结果的准确性、完整性、安全性或特定用途适用性作出保证。使用者应自行评估并承担安装、运行、修改和重打包的风险。在适用法律允许的范围内，维护者不对由此产生的损失承担责任；本说明不排除依法不得排除的责任。

### 权利问题反馈

如认为仓库内容涉及您的权利，请通过仓库可用的联系渠道（例如 GitHub Issues）提供相关文件路径、权利说明和具体诉求，维护者将核实并处理。请勿在公开反馈中提交身份证件、密钥或其他敏感信息。
