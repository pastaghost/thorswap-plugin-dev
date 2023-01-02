# syntax=docker/dockerfile:1
FROM ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder:latest
RUN apk add curl
RUN mkdir /home/dev
WORKDIR /home/dev
RUN curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/gccarmnoneeabi532016q120160330linuxtar.bz2 --output /home/dev/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN tar xjf /home/dev/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN rm /home/dev/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN curl https://releases.llvm.org/4.0.0/clang+llvm-4.0.0-aarch64-linux-gnu.tar.xz --output /home/dev/clang-arm-fropi.tar.xz
RUN tar xJf /home/dev/clang-arm-fropi.tar.xz
RUN rm /home/dev/clang-arm-fropi.tar.xz
RUN mv /home/dev/clang+llvm-4.0.0-aarch64-linux-gnu /home/dev/clang-arm-fropi
RUN export BOLOS_ENV=/home/dev
WORKDIR /app