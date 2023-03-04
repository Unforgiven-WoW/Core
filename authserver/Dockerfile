FROM core-base:latest AS base

RUN \
    cmake ../src \
    -DTOOLS=0 \
    -DWITH_WARNINGS=0 \
    -DCMAKE_INSTALL_PREFIX=/bin \
    -DCONF_DIR=/etc \
    -Who-dev

RUN make -j$(nproc) && \
    make install


WORKDIR /

# RUN cmake ../src -DTOOLS=0 -DWITH_WARNINGS=0 -DCMAKE_INSTALL_PREFIX=/opt/trinitycore -DCONF_DIR=/etc -Wno-dev
# RUN make -j$(nproc)
# RUN make install
# WORKDIR /artifacts
