"""Run with: python3 -m unittest discover -s scripts -p 'test_*.py'."""
import hashlib
import subprocess
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch

import package_release


class PackageReleaseTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.project = self.root / "hg1.2.0/project"
        for name in ("gradlew", "settings.gradle", "app/build.gradle", "tools/apktool.jar"):
            path = self.project / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("fixture\n")
        (self.project / "gradlew").chmod(0o755)
        (self.project / "apktool").mkdir()
        (self.project / "apktool/apktool.yml").write_text("versionInfo:\n  versionName: 1.2.0\n")
        original = self.root / "hg1.2.0/original/app.apk"
        original.parent.mkdir()
        with zipfile.ZipFile(original, "w") as archive:
            archive.writestr("AndroidManifest.xml", "fixture")
        (self.root / "README.md").write_text("Project documentation\n")
        self.git("init", "-q")
        self.commit()
        self.mock_root = patch.object(package_release, "ROOT", self.root)
        self.mock_root.start()
        self.addCleanup(self.mock_root.stop)

    def git(self, *args):
        return subprocess.check_output(["git", "-C", str(self.root), *args], stderr=subprocess.STDOUT)

    def commit(self):
        self.git("add", ".")
        self.git("-c", "user.name=Test", "-c", "user.email=test@example.invalid", "commit", "-qm", "fixture")

    def test_revision_archive_hashes_and_untracked_exclusion(self):
        (self.project / "local.properties").write_text("sdk.dir=/private/local\n")
        (self.project / "build").mkdir()
        (self.project / "build/private.txt").write_text("not distributed")
        result = package_release.package("hg1.2.0-r2", "HEAD", self.root / "dist")
        for line in (result / "SHA256SUMS.txt").read_text().splitlines():
            digest, name = line.split("  ")
            self.assertEqual(digest, hashlib.sha256((result / name).read_bytes()).hexdigest())
        self.assertEqual((result / "huangguo-1.2.0-r2-original.apk").read_bytes(), (self.root / "hg1.2.0/original/app.apk").read_bytes())
        with zipfile.ZipFile(result / "huangguo-1.2.0-r2-project.zip") as archive:
            self.assertIn("README.md", archive.namelist())
            self.assertNotIn("hg1.2.0/project/local.properties", archive.namelist())
            self.assertNotIn("hg1.2.0/project/build/private.txt", archive.namelist())
            self.assertTrue(archive.getinfo("hg1.2.0/project/gradlew").external_attr >> 16 & 0o111)
        with self.assertRaisesRegex(ValueError, "拒绝覆盖"):
            package_release.package("hg1.2.0-r2", "HEAD", self.root / "dist")

    def test_invalid_tag_and_missing_version(self):
        for tag in ("../../bad", "hg1.2", "hg1.2.0;echo", "hg1.2.0-r0", "hg9.9.9"):
            with self.subTest(tag=tag), self.assertRaises(ValueError):
                package_release.package(tag, "HEAD", self.root / "dist")

    def test_version_mismatch(self):
        (self.project / "apktool/apktool.yml").write_text("versionInfo:\n  versionName: 1.3.0\n")
        self.commit()
        with self.assertRaisesRegex(ValueError, "不一致"):
            package_release.package("hg1.2.0", "HEAD", self.root / "dist")

    def test_committed_local_configuration_rejected(self):
        (self.project / "local.properties").write_text("private")
        self.commit()
        with self.assertRaisesRegex(ValueError, "不应发布"):
            package_release.package("hg1.2.0", "HEAD", self.root / "dist")

    def test_multiple_original_apks_rejected(self):
        (self.root / "hg1.2.0/original/second.apk").write_bytes(b"extra")
        self.commit()
        with self.assertRaisesRegex(ValueError, "恰好"):
            package_release.package("hg1.2.0", "HEAD", self.root / "dist")


    def test_committed_key_rejected(self):
        (self.project / "tools/debug.keystore").write_bytes(b"test fixture, not a real key")
        self.commit()
        with self.assertRaisesRegex(ValueError, "密钥"):
            package_release.package("hg1.2.0", "HEAD", self.root / "dist")

    def test_generated_directory_rejected(self):
        (self.project / ".generated").mkdir()
        (self.project / ".generated/private.txt").write_text("test fixture")
        self.commit()
        with self.assertRaisesRegex(ValueError, "不应发布"):
            package_release.package("hg1.2.0", "HEAD", self.root / "dist")


if __name__ == "__main__":
    unittest.main()
