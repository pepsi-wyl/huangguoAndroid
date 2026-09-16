#!/usr/bin/env python3
"""Package one APK version from a committed Git snapshot (Python 3.9+)."""
import argparse
import hashlib
import re
import subprocess
import tempfile
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def git(*args):
    return subprocess.check_output(["git", "-C", str(ROOT), *args])


def package(tag, ref, output):
    match = re.fullmatch(r"hg(\d+\.\d+\.\d+)(?:-r([1-9]\d*))?", tag)
    if not match:
        raise ValueError("标签必须为 hg1.2.0 或 hg1.2.0-r2 格式")
    version = match[1]
    label = tag[2:]
    commit = git("rev-parse", "--verify", f"{ref}^{{commit}}").decode().strip()
    folder = f"hg{version}"
    paths = git("ls-tree", "-r", "--name-only", "-z", commit, "--", folder).decode().split("\0")
    apks = [p for p in paths if p.startswith(f"{folder}/original/") and p.endswith(".apk")]
    if len(apks) != 1:
        raise ValueError(f"{folder}/original/ 必须恰好包含一个已提交的原始 APK")
    metadata = git("show", f"{commit}:{folder}/project/apktool/apktool.yml").decode()
    actual = re.search(r"^\s+versionName:\s*['\"]?([\d.]+)['\"]?\s*$", metadata, re.M)
    if not actual or actual[1] != version:
        raise ValueError("标签版本与 apktool.yml 的 versionName 不一致")
    for required in ("gradlew", "settings.gradle", "app/build.gradle", "tools/apktool.jar"):
        if f"{folder}/project/{required}" not in paths:
            raise ValueError(f"缺少工程文件：{required}")
    # Even accidentally committed machine-specific/build files must not be distributed.
    forbidden = {"build", ".gradle", ".idea", ".run", ".git", ".cxx", ".externalNativeBuild", "local.properties", ".DS_Store", "captures", ".generated"}
    for path in paths:
        if path.lower().endswith((".keystore", ".jks", ".p12", ".pfx", ".key")):
            raise ValueError(f"版本目录含有不应发布的密钥文件：{path}")
        if path.startswith(f"{folder}/project/"):
            if forbidden.intersection(Path(path).parts) or path.endswith((".iml", ".log")):
                raise ValueError(f"工程中含有不应发布的已提交文件：{path}")
    output = Path(output).resolve()
    target = output / tag
    if target.exists():
        raise ValueError(f"输出目录已存在，拒绝覆盖：{target}")
    output.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".package-", dir=output) as temp:
        staging = Path(temp)
        apk = staging / f"huangguo-{label}-original.apk"
        with apk.open("wb") as stream:
            subprocess.run(["git", "-C", str(ROOT), "show", f"{commit}:{apks[0]}"], stdout=stream, check=True)
        if not zipfile.is_zipfile(apk):
            raise ValueError("原始 APK 不是有效 ZIP/APK；请检查是否误提交 Git LFS 指针")
        archive = staging / f"huangguo-{label}-project.zip"
        with archive.open("wb") as stream:
            subprocess.run(["git", "-C", str(ROOT), "archive", "--format=zip", commit, "--", f"{folder}/project", "README.md"], stdout=stream, check=True)
        with zipfile.ZipFile(archive) as z:
            if z.testzip() is not None:
                raise ValueError("工程 ZIP 校验失败")
            for required in ("README.md", f"{folder}/project/gradlew"):
                if required not in z.namelist():
                    raise ValueError(f"工程 ZIP 缺少 {required}")
        sums = []
        for asset in (apk, archive):
            digest = hashlib.sha256()
            with asset.open("rb") as stream:
                for block in iter(lambda: stream.read(1024 * 1024), b""):
                    digest.update(block)
            sums.append(f"{digest.hexdigest()}  {asset.name}\n")
        (staging / "SHA256SUMS.txt").write_text("".join(sums), encoding="utf-8")
        (staging / "release-notes.md").write_text(
            f"黄果 Android {version}，发布标签 `{tag}`。\n\n"
            f"源提交：`{commit}`\n\n"
            f"- `{apk.name}`：原始 APK，未重签名。\n"
            f"- `{archive.name}`：该版本反编译工程及 README。解压后用 Android Studio 打开 `{folder}/project/`。\n"
            "- `SHA256SUMS.txt`：下载文件的 SHA-256 校验值。\n\n"
            "工程需要本地 JDK 和 Android SDK；打包流程不代表已验证设备运行。\n"
            "GitHub 自动附带的 Source code 是完整仓库快照，单版本工程请下载上述 project.zip。\n"
            "首次构建会在本地自动生成项目专用调试密钥；使用范围及版权说明请阅读工程包内 README。\n",
            encoding="utf-8",
        )
        staging.rename(target)
    return target


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("tag", help="发布标签，例如 hg1.2.0 或 hg1.2.0-r2")
    parser.add_argument("--ref", help="源 Git 提交，默认读取同名标签；本地预览可用 HEAD")
    parser.add_argument("--output", default=str(ROOT / "dist"))
    args = parser.parse_args()
    try:
        print(package(args.tag, args.ref or f"refs/tags/{args.tag}", args.output))
    except (ValueError, subprocess.CalledProcessError) as error:
        parser.exit(1, f"打包失败：{error}\n")
