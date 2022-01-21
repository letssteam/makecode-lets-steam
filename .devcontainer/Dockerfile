# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/cpp/.devcontainer/base.Dockerfile
# [Choice] Debian / Ubuntu version (use Debian 11/9, Ubuntu 18.04/21.04 on local arm64/Apple Silicon): debian-11, debian-10, debian-9, ubuntu-21.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT=ubuntu-21.04
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# Install any needed packages specified in requirements.txt
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
  apt-get update && \
  apt-get upgrade -y -q && \
  apt-get install -y -q \
  clang-tidy \
  clang-format \
  openocd \
  ncurses-dev \
  libudev-dev \
  ninja-build \
  python3 \
  python3-pip \
  python3-setuptools \
  python3-wheel && \
  update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
  update-alternatives --install /usr/bin/python-config python-config /usr/bin/python3-config 1 && \
  update-alternatives --install /usr/bin/pydoc pydoc /usr/bin/pydoc3 1 && \
  apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Github CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
  sudo apt update && \
  sudo apt install gh && \
  apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install the last GCC from ARM
ENV ARM_GCC_VERSION 10-2020-q4-major
ENV ARM_GCC_PATH 10-2020q4
ENV ARCH x86_64
ENV OS linux

ENV ARM_GCC_INSTALL_FOLDER /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}
ENV ARM_GCC_FILENAME gcc-arm-none-eabi-${ARM_GCC_VERSION}-${ARCH}-${OS}.tar.bz2
ENV ARM_GCC_BASE_URL https://developer.arm.com/-/media/Files/downloads/gnu-rm
ENV ARM_GCC_URL ${ARM_GCC_BASE_URL}/${ARM_GCC_PATH}/${ARM_GCC_FILENAME}

RUN mkdir /arm_gcc && \
  cd /arm_gcc && \
  wget ${ARM_GCC_URL} -O ${ARM_GCC_FILENAME} && \
  tar xjf ${ARM_GCC_FILENAME} && \
  rm ${ARM_GCC_FILENAME}

ENV PATH="${ARM_GCC_INSTALL_FOLDER}/bin:${PATH}"

# make some useful symlinks that are expected to exist
RUN cd /usr/bin                                                                          && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-addr2line        && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-ar               && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-as               && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-c++              && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-c++filt          && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-cpp              && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-elfedit          && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-g++              && \            
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcc              && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcc-10.2.1       && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcc-ar           && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcc-nm           && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcc-ranlib       && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcov             && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcov-dump        && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gcov-tool        && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gdb              && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gdb-add-index    && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gdb-add-index-py && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gdb-py           && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-gprof            && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-ld               && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-ld.bfd           && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-lto-dump         && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-nm               && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-objcopy          && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-objdump          && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-ranlib           && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-readelf          && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-size             && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-strings          && \
  ln -s /arm_gcc/gcc-arm-none-eabi-${ARM_GCC_VERSION}/bin/arm-none-eabi-strip

# This is required to get arm-none-eabi-gdb working
RUN  cd /usr/lib/x86_64-linux-gnu && \
  ln -s libncurses.so.6.2 libncurses.so.5 && \
  ln -s libtinfo.so.6.2 libtinfo.so.5

ENV NODE_VERSION 14.18.3

RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
  amd64) ARCH='x64';; \
  ppc64el) ARCH='ppc64le';; \
  s390x) ARCH='s390x';; \
  arm64) ARCH='arm64';; \
  armhf) ARCH='armv7l';; \
  i386) ARCH='x86';; \
  *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  # smoke tests
  && node --version \
  && npm --version

ENV YARN_VERSION 1.22.5

RUN curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz \
  # smoke test
  && yarn --version

# Install needed packages, yarn, nvm and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG NPM_GLOBAL=/usr/local/share/npm-global
ENV NVM_DIR=/usr/local/share/nvm
ENV NVM_SYMLINK_CURRENT=true \ 
  PATH=${NPM_GLOBAL}/bin:${NVM_DIR}/current/bin:${PATH}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if ! cat /etc/group | grep -e "^npm:" > /dev/null 2>&1; then groupadd -r npm; fi \
  && usermod -a -G npm ${USERNAME} \
  && umask 0002 \
  && mkdir -p ${NPM_GLOBAL} \
  && chown ${USERNAME}:npm ${NPM_GLOBAL} \
  && chmod g+s ${NPM_GLOBAL} \
  && npm config -g set prefix ${NPM_GLOBAL} \
  && sudo -u ${USERNAME} npm config -g set prefix ${NPM_GLOBAL} \
  && su ${USERNAME} -c "umask 0002 && npm install -g eslint pxt npm" \
  && npm cache clean --force > /dev/null 2>&1 \
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /root/.gnupg /tmp/library-scripts