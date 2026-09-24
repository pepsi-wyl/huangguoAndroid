#!/usr/bin/env python3
"""Verify a baseline repack; write machine-specific evidence under verification/."""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import zipfile
from datetime import datetime, timezone
from pathlib import Path


PROJECT = Path(__file__).resolve().parents[1]


def sha256(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(block)
    return digest.hexdigest()


def compare_payload(original, rebuilt):
    def names(archive):
        return {n for n in archive.namelist() if n.startswith(('assets/', 'lib/')) and not n.endswith('/')}
    with zipfile.ZipFile(original) as source, zipfile.ZipFile(rebuilt) as target:
        before, after = names(source), names(target)
        changed = sorted(n for n in before & after if source.read(n) != target.read(n))
        return {'compared': len(before), 'missing': sorted(before - after),
                'added': sorted(after - before), 'changed': changed}


def sdk_directory(explicit):
    if explicit:
        return Path(explicit)
    properties = PROJECT / 'local.properties'
    if properties.exists():
        for line in properties.read_text().splitlines():
            if line.strip().startswith('sdk.dir='):
                return Path(line.split('=', 1)[1].strip().replace('\\:', ':').replace('\\\\', '\\'))
    for name in ('ANDROID_HOME', 'ANDROID_SDK_ROOT'):
        if os.environ.get(name):
            return Path(os.environ[name])
    raise ValueError('SDK 未配置，请传入 --sdk 或配置 local.properties / ANDROID_HOME')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', type=Path, help='单版本工程 ZIP 的用户须指定另行下载的原始 APK')
    parser.add_argument('--apk', type=Path, default=PROJECT / 'app/build/outputs/apk/debug/hgdj-debug.apk')
    parser.add_argument('--sdk', help='Android SDK 根目录')
    args = parser.parse_args()
    metadata = json.loads((PROJECT / 'provenance.json').read_text())
    original = args.original or PROJECT.parent / 'original' / metadata['originalApk']
    output = PROJECT / 'verification'
    output.mkdir(exist_ok=True)
    report = {'verifiedAt': datetime.now(timezone.utc).isoformat(), 'status': 'failed',
              'scope': 'baseline APK integrity, metadata, signature and alignment; no runtime/business checks'}

    def run(name, command):
        result = subprocess.run([str(arg) for arg in command], text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (output / (name + '.log')).write_text(result.stdout)
        if result.returncode:
            raise ValueError(f'{name} 失败，请查看 verification/{name}.log')
        return result.stdout

    try:
        report['originalSha256'] = sha256(original)
        if report['originalSha256'] != metadata['originalSha256']:
            raise ValueError('原始 APK SHA-256 与 provenance.json 不一致')
        report['debugSha256LocalOnly'] = sha256(args.apk)
        payload = compare_payload(original, args.apk)
        report['payload'] = payload
        if any(payload[key] for key in ('missing', 'added', 'changed')):
            raise ValueError('assets/ 或 lib/ 与原包不同；本脚本用于无业务修改的基线重打包验证')
        sdk = sdk_directory(args.sdk)
        build_tools = sdk / 'build-tools' / metadata['tools']['buildTools']
        suffix = '.exe' if os.name == 'nt' else ''
        badging = run('badging', [build_tools / ('aapt' + suffix), 'dump', 'badging', args.apk])
        package = re.search(r"^package: name='([^']+)' versionCode='([^']+)' versionName='([^']+)'", badging, re.M)
        expected = (metadata['debugPackage'], str(metadata['versionCode']), metadata['versionName'])
        if not package or package.groups() != expected:
            raise ValueError('调试 APK 包名或版本不匹配')
        if 'application-debuggable' not in badging:
            raise ValueError('调试 APK 未启用 debuggable')
        java = Path(os.environ['JAVA_HOME']) / 'bin' / ('java' + suffix) if os.environ.get('JAVA_HOME') else 'java'
        run('signature', [java, '-jar', build_tools / 'lib/apksigner.jar', 'verify', '--verbose', args.apk])
        run('alignment', [build_tools / ('zipalign' + suffix), '-c', '-P', '16', '4', args.apk])
        report['status'] = 'passed'
    except (OSError, ValueError, zipfile.BadZipFile) as error:
        report['error'] = str(error)
        print(f'验证失败：{error}', file=sys.stderr)
    finally:
        (output / 'integrity.json').write_text(json.dumps(report, indent=2, ensure_ascii=False) + '\n')
    if report['status'] != 'passed':
        return 1
    print(f"验证通过：{report['payload']['compared']} 个 assets/原生库条目一致，包名、版本、调试标记、签名及对齐通过。")
    print('本地报告：' + str(output / 'integrity.json'))
    return 0


if __name__ == '__main__':
    sys.exit(main())
