# Tomita-Docker

A non-official Docker image with Yandex Tomita-parser. Currently does not build due to the STLport and GCC incompatibility problems.

[![Docker Hub][docker_badge]][docker_link]

[docker_badge]: https://img.shields.io/docker/pulls/nlpub/tomita.svg
[docker_link]: https://hub.docker.com/r/nlpub/tomita/

## Conditions

Tomita-parser includes [mystem](https://tech.yandex.ru/mystem/) as a shared library. Hence, using this image assumes that you agree with the corresponding [EULA](https://legal.yandex.ru/mystem/).
