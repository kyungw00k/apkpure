---
name: apkpure
description: CLI tool to download APK files from APKPure
version: 1.0.0
---

# apkpure CLI

Download APK files from APKPure.

## Commands

### Download an app

```bash
apkpure -a <package_id>[@version] <output_path>
```

| Parameter | Required | Description |
|-----------|----------|-------------|
| `-a, --app` | Yes (or `-c`) | App ID, optionally with `@version` |
| `output_path` | Yes | Directory to save downloaded files |

### List available versions

```bash
apkpure -l -a <package_id>
```

### Batch download from CSV

```bash
apkpure -c <csv_file> [-f <field>] [-v <version_field>] <output_path>
```

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| `-c, --csv` | Yes | | CSV file path |
| `-f, --field` | No | `1` | CSV column number for app IDs |
| `-v, --version-field` | No | | CSV column number for versions |

### Download options

```bash
apkpure -a <package_id> -o <key>=<value>[,<key>=<value>...] <output_path>
```

| Option | Values | Description |
|--------|--------|-------------|
| `arch` | `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64` | Target architecture |
| `language` | `en-US`, `ko-KR`, etc. | Language code |
| `os_ver` | `35`, etc. | Android OS version |
| `output_format` | `plaintext`, `json` | Output format for list commands |

### Common flags

| Flag | Description |
|------|-------------|
| `-r, --parallel` | Number of parallel downloads (default: 4) |
| `-s, --sleep-duration` | Delay between downloads in milliseconds |
| `-V, --version` | Show version |

## Examples

```bash
# Download latest Instagram APK
apkpure -a com.instagram.android ./apks

# Download specific version
apkpure -a com.instagram.android@150.0.0.0 ./apks

# List versions
apkpure -l -a com.instagram.android

# Download with architecture filter
apkpure -a com.instagram.android -o arch=arm64-v8a ./apks

# Batch download 3 apps with 8 workers
apkpure -c apps.csv -r 8 ./apks
```
