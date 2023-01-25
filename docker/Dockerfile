# syntax=docker/dockerfile:1
FROM ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder:latest
RUN apk add curl
WORKDIR /opt
RUN curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/gccarmnoneeabi532016q120160330linuxtar.bz2 --output /opt/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN tar xjf /opt/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN rm /opt/gccarmnoneeabi532016q120160330linuxtar.bz2
RUN curl https://releases.llvm.org/4.0.0/clang+llvm-4.0.0-aarch64-linux-gnu.tar.xz --output /opt/clang-arm-fropi.tar.xz
RUN tar xJf /opt/clang-arm-fropi.tar.xz
RUN rm /opt/clang-arm-fropi.tar.xz
RUN mv /opt/clang+llvm-4.0.0-aarch64-linux-gnu /opt/clang-arm-fropi
WORKDIR /opt/nanos-secure-sdk
RUN cp -R /opt/gcc-arm-none-eabi-5_3-2016q1 . && cp -R /opt/clang-arm-fropi .
WORKDIR /opt/nanosplus-secure-sdk
RUN cp -R /opt/gcc-arm-none-eabi-5_3-2016q1 . && cp -R /opt/clang-arm-fropi .
WORKDIR /opt/nanox-secure-sdk
RUN cp -R /opt/gcc-arm-none-eabi-5_3-2016q1 . && cp -R /opt/clang-arm-fropi .
WORKDIR /opt
RUN rm -rf gcc-arm-none-eabi-5_3-2016q1 clang-arm-fropi
WORKDIR /app