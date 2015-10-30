FROM debian:wheezy

MAINTAINER Dmitry Ustalov <dmitry@eveel.ru>

RUN \
apt-get update && \
apt-get install -y -o Dpkg::Options::="--force-confold" build-essential cmake curl unzip lua5.2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN \
curl -sL \
-O 'https://github.com/yandex/tomita-parser/archive/master.zip' \
-O 'https://github.com/yandex/tomita-parser/releases/download/v1.0/libmystem_c_binding.so.linux_x64.zip' && \
unzip /master.zip && \
rm -f master.zip && \
mv tomita-parser-master tomita && \
mkdir -p /tomita/build && \
cd /tomita/build && \
unzip /libmystem_c_binding.so.linux_x64.zip && \
rm -f /libmystem_c_binding.so.linux_x64.zip

WORKDIR /tomita/build

RUN cmake ../src/ -DMAKE_ONLY=FactExtract/Parser/tomita-parser -DCMAKE_BUILD_TYPE=Release
RUN make -j4
