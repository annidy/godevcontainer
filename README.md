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

## Build

```sh
docker build -f alpine.Dockerfile -t annidy/godevcontainer .
```

## Setup for a project

1. Setup your configuration files
    - With style 💯

        ```sh
        docker run -v -it "`pwd`:/root" --privileged --name my_repo annidy/godevcontainer
        ```
    - Or manually: download this repository and put the [.devcontainer](.devcontainer) directory in your project.
1. If you have a *.vscode/settings.json*, eventually move the settings to *.devcontainer/devcontainer.json* in the `"settings"` section as *.vscode/settings.json* take precedence over the settings defined in *.devcontainer/devcontainer.json*.
1. Open the command palette in Visual Studio Code (CTRL+SHIFT+P) and select `Remote-Containers: Open Folder in Container...` and choose your project directory

