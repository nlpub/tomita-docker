FROM buildpack-deps:xenial-scm

MAINTAINER Dmitry Ustalov <dmitry.ustalov@gmail.com>

RUN \
apt-get update && \
apt-get install -y -o Dpkg::Options::="--force-confold" --no-install-recommends build-essential cmake unzip lua5.2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN \
git clone 'https://github.com/yandex/tomita-parser.git' tomita && \
mkdir -p /tomita/build && \
cd /tomita/build && \
cmake ../src/ -DMAKE_ONLY=FactExtract/Parser/tomita-parser -DCMAKE_BUILD_TYPE=Release && \
make -j2 && \
mv /tomita/build/FactExtract/Parser/tomita-parser/tomita-parser /tomita/parser && \
rm -rf /tomita/.git /tomita/src /tomita/build

RUN \
curl -sL -O 'https://github.com/yandex/tomita-parser/releases/download/v1.0/libmystem_c_binding.so.linux_x64.zip' && \
unzip /libmystem_c_binding.so.linux_x64.zip && \
mv -f /libmystem_c_binding.so /tomita/libmystem_c_binding.so && \
chmod +x /tomita/libmystem_c_binding.so && \
rm -f /libmystem_c_binding.so.linux_x64.zip && \
echo '#!/bin/sh\n/tomita/parser $@' >/usr/bin/tomita-parser && \
chmod +x /usr/bin/tomita-parser
