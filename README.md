# apkpure

A Go library and CLI tool for downloading APK files from APKPure.

![demo](docs/demo.gif)

This project is a Go port of the APKPure functionality from [apkeep](https://github.com/EFForg/apkeep).

## Features

- Download APK files from APKPure
- List available versions for apps
- Download specific versions
- Parallel downloads
- Progress tracking
- CSV batch processing
- Support for different architectures

## Installation

### Homebrew

```bash
brew install kyungw00k/cli/apkpure
```

### Go

```bash
go install github.com/kyungw00k/apkpure/cmd/apkpure@latest
```

### Shell script

```bash
curl -fsSL https://kyungw00k.dev/apkpure/install.sh | sh
```

### As a library

```bash
go get github.com/kyungw00k/apkpure
```

## Quick Start

```bash
# Download the latest version of an app
apkpure -a com.instagram.android /path/to/output

# Download a specific version
apkpure -a com.instagram.android@150.0.0.0 /path/to/output

# List available versions
apkpure -l -a com.instagram.android

# Download from a CSV file
apkpure -c apps.csv /path/to/output

# Show version
apkpure -V
```

## CLI Options

| Flag | Description | Default |
|------|-------------|---------|
| `-a, --app` | App ID (e.g., `com.instagram.android` or `com.instagram.android@1.2.3`) | |
| `-c, --csv` | CSV file containing app IDs | |
| `-f, --field` | CSV field number containing app IDs | `1` |
| `-v, --version-field` | CSV field number containing versions | |
| `-l, --list-versions` | List available versions | |
| `-o, --options` | Additional options (e.g., `arch=arm64-v8a,language=en-US`) | |
| `-r, --parallel` | Number of parallel downloads | `4` |
| `-s, --sleep-duration` | Sleep duration between downloads in milliseconds | `0` |
| `-V, --version` | Show version | |

## Download Options

When using `-o` or `--options`, you can specify:

- `arch`: Architecture (e.g., `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`)
- `language`: Language code (e.g., `en-US`, `ko-KR`)
- `os_ver`: Android OS version (e.g., `35` for Android 15)
- `output_format`: Output format for list commands (`plaintext` or `json`)

Multiple options can be combined with commas:
```bash
apkpure -a com.instagram.android -o arch=arm64-v8a,language=ko-KR /output
```

## Library Usage

```go
package main

import (
    "log"
    "github.com/kyungw00k/apkpure/pkg/apkpure"
)

func main() {
    opts := apkpure.DownloadOptions{
        Arch:             "arm64-v8a",
        ProgressCallback: apkpure.SimpleProgressCallback(),
    }
    client := apkpure.NewClient(opts)

    app := apkpure.AppInfo{
        PackageID: "com.instagram.android",
    }

    err := client.Download(app, "/path/to/output")
    if err != nil {
        log.Fatal(err)
    }
}
```

## Documentation

See the [project page](https://kyungw00k.dev/apkpure/) for full documentation.

## Examples

See the [examples](examples/) directory for more usage examples.

## Claude Code Skill

A Claude Code skill is available for AI agents to use apkpure automatically.

```
/plugin marketplace add kyungw00k/skills
/plugin install cli-tools@kyungw00k-skills
```

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Credits

This project is a Go port of the APKPure functionality from [apkeep](https://github.com/EFForg/apkeep) by the Electronic Frontier Foundation (EFF).
