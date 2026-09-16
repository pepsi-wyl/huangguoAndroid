# 项目记忆

- 项目名称为 `huangguoAndroid`，按原始 APK 的实际版本维护，目录格式为 `hg<versionName>/`。
- 当前版本为 `hg1.2.0`（versionCode 120）；`original/` 保存该版本原始 APK，`project/` 保存该版本独立可构建、可运行的反编译工程。
- Android Studio 应打开对应版本的 `project/` 目录，Gradle 命令也在该目录执行。新增版本时创建新的版本目录，不覆盖旧版本。

- 本项目是“黄果 APP”反编译后的产物。
- 项目中同时有原始 APK，可运行原始 APK 进行行为验证，并与反编译产物对照分析。
- 后续分析、修改和调试应优先考虑反编译代码的结构与命名可能不完整、存在混淆，以及资源和构建配置可能与原始工程不完全一致。

## 发版记忆

- 公开仓库：`https://github.com/pepsi-wyl/huangguoAndroid`。`hg1.2.0` 已正式发布，作为后续版本的流程参考；每次操作前核实远程、分支及发布状态。
- 发布新版本、修订旧版本或排查发版失败时，先阅读 `README.md` 的“下载与发布”“调试签名”章节；具体实现以 `scripts/package_release.py` 和 `.github/workflows/release.yml` 为准。
- 新 APK 使用新的 `hg<versionName>/` 目录；同一 APK 的工程修订使用 `hg<versionName>-rN` 标签，仍从原版本目录打包。保留已发布标签和附件，修订通过新标签发布。
- 准备发布：确认目录内原始 APK 唯一、版本匹配，在对应 `project/` 下构建并验证；在仓库根目录运行 `python3 -m unittest discover -s scripts -p 'test_*.py'`。打包工作流本身不验证 Android 构建或设备运行。
- 提交后使用 `python3 scripts/package_release.py <标签> --ref HEAD` 本地预览。正式打包省略 `--ref`，读取同名标签。输出目录已存在时使用新的 `--output` 目录，避免混入旧附件；脚本只打包已提交内容。
- 推送代码和明确指定的版本标签，等待 Actions 成功；它创建的是 Release 草稿。核验原始 APK、单版本工程 ZIP、`SHA256SUMS.txt` 三个附件后，在用户要求正式发版时发布草稿，并检查公开下载链接可用。若仅要求草稿，保留草稿并说明尚未公开。
- 附件核验：原始 APK 应与输入文件逐字节一致；工程包应仅包含该版本工程及 README，保留 `gradlew` 执行权限。不同平台 Git 生成的 ZIP 可能哈希不同，应核对各自校验清单和解压后的内容，不能仅凭 ZIP 哈希差异判定内容变更。
- 调试密钥首次构建时生成并保存在各工程 `.generated/debug-signing/`，后续复用；源码历史和发布包均不得包含私钥或本地生成目录。旧的含密钥历史备份、内部引用及过期附件只留本机，推送只指定经过检查的分支和标签，不使用 `--mirror`。
- 完成标准：构建及打包测试通过、待发布历史和工程包无私钥、远程提交与标签正确、Actions 成功、附件完整且校验通过；正式发布还须确认 Release 已非草稿，并向用户提供下载链接。
