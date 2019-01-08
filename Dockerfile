FROM fedora:28
LABEL maintainer="james@puiterwijk.org"

ENV OUTFMT jpg

RUN dnf -y install 'dnf-command(builddep)' && \
    dnf -y builddep darktable && \
    dnf -y install make git && \
    cd /tmp && \
    git clone --depth 1 https://github.com/darktable-org/darktable.git && \
    cd darktable && \
    git submodule init && \
    git submodule update && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j$(nproc) && \
    make install && \
    mkdir /images

COPY darktable-batch.sh /

ENTRYPOINT ["/darktable-batch.sh", "/images"]
