FROM ubuntu:22.04 AS build

LABEL author="Snuffish <snuffish90@gmail.com>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="snuffish/Unforgiven-WoW"

ARG GIT_BRANCH=master
ARG GIT_REPO=https://github.com/Unforgiven-WoW/Core.git
ARG TDB_URL=https://github.com/TrinityCore/TrinityCore/releases/download/TDB335.23011/TDB_full_world_335.23011_2023_01_16.7z

# Install necessary software's
RUN apt-get update \
    && apt-get install -y \
        git \
        wget \
        clang \
        cmake \
        make \
        gcc \
        g++ \
        libmysqlclient-dev \
        libssl-dev \
        libbz2-dev \
        libreadline-dev \
        libncurses-dev \
        libboost-all-dev \
        mysql-server \
        p7zip-full \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

RUN git clone --branch ${GIT_BRANCH} --single-branch --depth 1 ${GIT_REPO} /src

# Build the Core
RUN mkdir -pv /build/ /artifacts/
WORKDIR /build
RUN cmake ../src -DTOOLS=0 -DWITH_WARNINGS=0 -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/etc -Wno-dev
RUN make -j$(nproc)
RUN make install
WORKDIR /artifacts

# Copy built binaries and configuration files
RUN tar -cf - \
    /usr/share/ca-certificates \
    /etc/ca-certificates* \
    /bin/bash \
    /usr/local/bin \
    /usr/bin/mysql \
    /usr/bin/curl \
    /usr/bin/7zr \
    /usr/bin/jq \
    /usr/bin/git \
    /usr/bin/xml2 \
    /opt/trinitycore \
    /etc/*server.conf.dist \
  | tar -C /artifacts/ -xvf -

ENV LD_LIBRARY_PATH=/lib:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu PATH=/bin:/usr/bin:/usr/local/bin:/opt/trinitycore/bin

RUN wget ${TDB_URL} -O /tdb.7z \
    && 7z x /tdb.7z -o/ \
    && rm /tdb.7z

WORKDIR /
