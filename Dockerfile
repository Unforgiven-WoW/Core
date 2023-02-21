FROM ubuntu:22.04 AS build

LABEL author="Snuffish <snuffish90@gmail.com>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="snuffish/Unforgiven-WoW"

ARG GIT_BRANCH=master
ARG GIT_REPO=https://github.com/Unforgiven-WoW/Core.git

# Install necessary software's
RUN apt-get update \
    && apt-get install -y \
        git \
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
        p7zip \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100

RUN git clone --branch ${GIT_BRANCH} --single-branch --depth 1 ${GIT_REPO} /src

RUN mkdir -pv /build/ /artifacts/
WORKDIR /build
RUN cmake ../src -DTOOLS=1 -DWITH_WARNINGS=0 -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/etc -Wno-dev
RUN make -j$(nproc)
RUN make install
