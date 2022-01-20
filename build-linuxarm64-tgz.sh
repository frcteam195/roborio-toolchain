#!/bin/sh

(docker pull guitar24t/roborio-toolchain-builder:arm64 || true) \
 && docker run -v ${PWD}:/artifacts guitar24t/roborio-toolchain-builder:arm64 bash -c "\
  cp /artifacts/download.sh /artifacts/repack.sh /artifacts/versions.sh . \
  && cp -R /artifacts/tools /artifacts/patches /artifacts/linux . \
  && echo 'downloading' && zsh download.sh \
  && zsh repack.sh \
  && cd linux \
  && ./build.sh \
  && cp *.tar.gz /artifacts/"
