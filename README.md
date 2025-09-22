# metar-pkg

Automated packaging of the [metar](https://github.com/RyuKojiro/metar) command-line METAR weather data tool.

This repository provides automated builds and packaging of the upstream metar tool, which fetches and displays METAR weather reports from NOAA weather stations.

## About metar

metar is a simple command-line tool that retrieves current weather observations (METAR) and terminal area forecasts (TAF) from NOAA's Aviation Weather Center. It accepts airport codes and displays the raw or decoded weather data.

**Upstream repository**: [github.com/RyuKojiro/metar](https://github.com/RyuKojiro/metar)

## Usage

```bash
# Get METAR for airport code
metar KJFK

# Get decoded METAR output
metar -d KJFK

# Get TAF (forecast) where available
metar -t KJFK

# Multiple airports
metar KJFK KLAX KORD
```

### Docker

```bash
docker run --rm cdzombak/metar:latest KJFK
```

## Installation

### Debian via apt repository

Set up my `3p` apt repository:

```shell
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://dist.cdzombak.net/keys/dist-cdzombak-net.gpg -o /etc/apt/keyrings/dist-cdzombak-net.gpg
sudo chmod 644 /etc/apt/keyrings/dist-cdzombak-net.gpg
sudo mkdir -p /etc/apt/sources.list.d
sudo curl -fsSL https://dist.cdzombak.net/cdzombak-3p.sources -o /etc/apt/sources.list.d/cdzombak-3p.sources
sudo chmod 644 /etc/apt/sources.list.d/cdzombak-3p.sources
sudo apt update
```

Then install `metar` via `apt-get`:

```shell
sudo apt-get install metar
```

### Homebrew

```shell
brew install cdzombak/3p/metar
```

### Manual from build artifacts

Pre-built binaries for Linux on various architectures are downloadable from each [GitHub Release](https://github.com/cdzombak/metar-pkg/releases). Debian packages for each release are available as well.

## Versioning

This repository uses a date-based versioning scheme since the upstream repository doesn't use releases. Versions follow the format `vYYYY.MM.DD.N` where `N` is an incrementing counter for builds on the same day.

Builds are automatically triggered daily and only occur when new commits are detected in the upstream repository.

## License

The metar tool is licensed under the MIT License. See the [upstream repository](https://github.com/RyuKojiro/metar) for license details.

## Author

Packaging by Chris Dzombak
- [dzombak.com](https://www.dzombak.com)
- [GitHub @cdzombak](https://github.com/cdzombak)

Original metar tool by Daniel Loffgren
- [GitHub @RyuKojiro](https://github.com/RyuKojiro)