# Go Dev Container

**Ultimate Go development container for Visual Studio Code**

[![godevcontainer](https://github.com/annidy/godevcontainer/raw/master/title.png)](https://hub.docker.com/r/annidy/godevcontainer)

[![Alpine](https://github.com/annidy/godevcontainer/actions/workflows/alpine.yml/badge.svg)](https://github.com/annidy/godevcontainer/actions/workflows/alpine.yml)
[![Debian](https://github.com/annidy/godevcontainer/actions/workflows/debian.yml/badge.svg)](https://github.com/annidy/godevcontainer/actions/workflows/debian.yml)

[![dockeri.co](https://dockeri.co/image/annidy/godevcontainer)](https://hub.docker.com/r/annidy/godevcontainer)

![Last Docker tag](https://img.shields.io/docker/v/annidy/godevcontainer?sort=semver&label=Last%20Docker%20tag)
[![Latest size](https://img.shields.io/docker/image-size/annidy/godevcontainer/latest?label=Latest%20image)](https://hub.docker.com/r/annidy/godevcontainer/tags)

![Last release](https://img.shields.io/github/release/annidy/godevcontainer?label=Last%20release)
[![Last release size](https://img.shields.io/docker/image-size/annidy/godevcontainer?sort=semver&label=Last%20released%20image)](https://hub.docker.com/r/annidy/godevcontainer/tags?page=1&ordering=last_updated)
![GitHub last release date](https://img.shields.io/github/release-date/annidy/godevcontainer?label=Last%20release%20date)
![Commits since release](https://img.shields.io/github/commits-since/annidy/godevcontainer/latest?sort=semver)

[![GitHub last commit](https://img.shields.io/github/last-commit/annidy/godevcontainer.svg)](https://github.com/annidy/godevcontainer/commits/main)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/y/annidy/godevcontainer.svg)](https://github.com/annidy/godevcontainer/graphs/contributors)
[![GitHub closed PRs](https://img.shields.io/github/issues-pr-closed/annidy/godevcontainer.svg)](https://github.com/annidy/godevcontainer/pulls?q=is%3Apr+is%3Aclosed)
[![GitHub issues](https://img.shields.io/github/issues/annidy/godevcontainer.svg)](https://github.com/annidy/godevcontainer/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/annidy/godevcontainer.svg)](https://github.com/annidy/godevcontainer/issues?q=is%3Aissue+is%3Aclosed)

[![Lines of code](https://img.shields.io/tokei/lines/github/annidy/godevcontainer)](https://github.com/annidy/godevcontainer)
![Code size](https://img.shields.io/github/languages/code-size/annidy/godevcontainer)
![GitHub repo size](https://img.shields.io/github/repo-size/annidy/godevcontainer)

![Visitors count](https://visitor-badge.laobi.icu/badge?page_id=godevcontainer.readme)

## Features

- Compatible with `amd64`, `386`, `arm64`, `armv6` and `armv7` CPUs
- `annidy/godevcontainer:alpine` and `annidy/godevcontainer`
  - Based on Alpine 3.19 (size of 936MB)
- `annidy/godevcontainer:debian` - **beware [it has CVE](https://github.com/annidy/godevcontainer/runs/596825646?check_suite_focus=true) because of outdated packages**
  - Based on Debian Buster Slim (size of 1.24GB)
- Based on [annidy/basedevcontainer](https://github.com/annidy/basedevcontainer)
  - Based on either Alpine or Debian
  - Minimal custom terminal and packages
  - See more [features](https://github.com/annidy/basedevcontainer#features)
- Go 1.22 code obtained from the latest tagged Golang Docker image
- Go tooling [integrating with VS code](https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on), all cross built statically from source at the [binpot](https://github.com/annidy/binpot):
  - [Google's Go language server gopls](https://github.com/golang/tools/tree/master/gopls)
  - [golangci-lint](https://github.com/golangci/golangci-lint), includes golint and other linters
  - [dlv](https://github.com/go-delve/delve/cmd/dlv) ⚠️ only works on `amd64` and `arm64`
  - [gomodifytags](https://github.com/fatih/gomodifytags)
  - [goplay](https://github.com/haya14busa/goplay)
  - [impl](https://github.com/josharian/impl)
  - [gotype-live](https://github.com/tylerb/gotype-live)
  - [gotests](https://github.com/cweill/gotests)
  - [gopkgs v2](https://github.com/uudashr/gopkgs/tree/master/v2)
- Terminal Go tools
  - [mockgen](https://github.com/golang/mock) to generate mocks
  - [mockery](https://github.com/vektra/mockery) to generate mocks for testify/mock
- Cross platform
  - Easily bind mount your SSH keys to use with **git**
  - Manage your host Docker from within the dev container, more details at [annidy/basedevcontainer](https://github.com/annidy/basedevcontainer#features)
- Extensible with docker-compose.yml
- Comes with extra Go binary tools for a few extra MBs: `kubectl`, `kubectx`, `kubens`, `stern` and `helm`

## Requirements

- [Docker](https://www.docker.com/products/docker-desktop) installed and running
  - If you don't use Linux or Windows with WSL, share the directory `~/.ssh` and the directory of your project with Docker Desktop
- [Docker Compose](https://docs.docker.com/compose/install/) installed
- [VS code](https://code.visualstudio.com/download) installed
- [VS code remote containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed

## Setup for a project

1. Setup your configuration files
    - With style 💯

        ```sh
        docker run -it --rm -v "/yourrepopath:/repository" annidy/devtainr:v0.2.0 -dev go -path /repository -name projectname
        ```

        Or use the [built binary](https://github.com/annidy/devtainr#binary)
    - Or manually: download this repository and put the [.devcontainer](.devcontainer) directory in your project.
1. If you have a *.vscode/settings.json*, eventually move the settings to *.devcontainer/devcontainer.json* in the `"settings"` section as *.vscode/settings.json* take precedence over the settings defined in *.devcontainer/devcontainer.json*.
1. Open the command palette in Visual Studio Code (CTRL+SHIFT+P) and select `Remote-Containers: Open Folder in Container...` and choose your project directory

## Customization

See the [.devcontainer/README.md](.devcontainer/README.md) document in your repository.

## TODOs

- [annidy/basedevcontainer](https://github.com/annidy/basedevcontainer) todos

## License

This repository is under an [MIT license](https://github.com/annidy/godevcontainer/master/LICENSE) unless indicated otherwise.
