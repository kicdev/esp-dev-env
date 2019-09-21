#!/usr/bin/env bash

# Copyright 2018 Rafal Zajac <rzajac@gmail.com>.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations

# Script for initializing ESP8266 development environment.

echo "Initializing ESP8266 development environment."
if [ "${ESPROOT}" == "" ]; then export ESPROOT=$HOME/esproot; fi
if ! [ -d "${ESPROOT}" ]; then mkdir -p "${ESPROOT}"; fi
echo "Using ${ESPROOT} as ESPROOT."

PY_VER=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

if [ "2.7" != "${PY_VER}" ]; then
  echo "ESP Open SDK requires Python 2.7 but detected ${PY_VER}"
  exit 1
fi

# Install required packages.
echo "Installing required packages (needs sudo)"
sudo apt -y install libtool-bin build-essential cmake make unrar-free \
                      autoconf automake libtool gcc g++ gperf \
                      flex bison texinfo gawk ncurses-dev libexpat-dev \
                      python-dev python python-serial \
                      sed unzip help2man wget bzip2
if [ $? != 0 ]; then exit 1; fi

pip install pyserial
if [ $? != 0 ]; then exit 1; fi

(
  cd "${ESPROOT}" || exit 1
  mkdir bin

  git clone https://github.com/espressif/esptool.git
  if [ $? != 0 ]; then exit 1; fi

  git clone --recursive https://github.com/kicdev/esp-open-sdk.git
  if [ $? != 0 ]; then exit 1; fi

  echo "Building OpenSDK. This might take a while..."
  cd "${ESPROOT}/esp-open-sdk" || exit 1
  make STANDALONE=y
)

echo
echo "Directory structure and all the necessary software has been checked out"
echo "and build. Good luck!"
echo
