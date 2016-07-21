# Tomita-Docker

A non-official Docker image with [Tomita-parser](https://tech.yandex.ru/tomita).

[![Docker Hub][docker_badge]][docker_link]

[docker_badge]: https://img.shields.io/docker/pulls/nlpub/tomita.svg
[docker_link]: https://hub.docker.com/r/nlpub/tomita/

## Usage

For conveniency, the globally available `tomita-parser` command wraps the `/tomita/parser` executable.

```
$ cd /tomita/examples/tutorial1
$ tomita-parser config.proto
```

## Conditions

Tomita-parser includes [mystem](https://tech.yandex.ru/mystem/) as a shared library. Hence, using this image assumes that you agree with the corresponding [EULA](https://legal.yandex.ru/mystem/).
