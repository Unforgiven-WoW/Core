FROM core-base:latest AS base

WORKDIR /build

RUN \
    make -j$(nproc)
    # make -j$(nproc) authserver

# RUN cmake ../src -DTOOLS=0 -DWITH_WARNINGS=0 -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/etc -Wno-dev
# RUN make -j$(nproc)
# RUN make install
# WORKDIR /artifacts
