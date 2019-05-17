FROM debian:stretch

# update and install dependencies
RUN apt-get update -y && apt-get install -y \
    cmake \
    clang-4.0 \
    bison \
    flex xz-utils \
    libfuse-dev \
    libudev-dev \
    pkg-config \
    libc6-dev-i386 \
    linux-headers-amd64 \
    libcap2-bin \
    git \
    libcairo2-dev \
    libgl1-mesa-dev \
    libtiff5-dev \
    libfreetype6-dev \
    libxml2-dev \
    libegl1-mesa-dev \
    libfontconfig1-dev \
    libbsd-dev

# clone source
RUN git clone --recursive https://github.com/darlinghq/darling.git

# build
RUN cd darling && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install && \
    make lkm && \
    make lkm_install

# TODO: expose darling shell instead of bash - maybe .bashrc?
