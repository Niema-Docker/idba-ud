# Minimal Docker image for IDBA-UD using Alpine base
FROM alpine:latest

# install IDBA-UD
RUN apk update && \
    apk add --no-cache bash gcc make musl-dev && \
    wget -qO- "https://github.com/loneknightpy/idba/releases/download/1.1.3/idba-1.1.3.tar.gz" | tar -zx && \
    cd idba-* && \
    ./configure && \
    make && \
    make install && \
    rm -rf bin/*.o bin/Makefile* && \
    mv bin/* /usr/local/bin/ && \
    cd .. && \
    rm -rf idba-*
