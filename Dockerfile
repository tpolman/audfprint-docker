# -*- coding: utf-8 -*-
FROM ubuntu:14.04
MAINTAINER Takahiro INOUE <takahiro.inoue@aist.go.jp>

RUN apt-get update

RUN apt-get --force-yes -y install \
  curl               \
  libav-tools        \
  libsamplerate0     \
  libsamplerate0-dev \
  libsndfile1        \
  libsndfile-dev     \
  python             \
  python-dev         \
  python-matplotlib  \
  python-numpy       \
  python-scipy       \
  python-setuptools

RUN easy_install --verbose \
  docopt             \
  joblib             \
  librosa            \
  scikits.audiolab   \
  scikits.example    \
  scikits.samplerate \
  scikits.talkbox

RUN ln -s /usr/bin/avconv /usr/local/bin/avconv
RUN ln -s /usr/bin/avconv /usr/local/bin/ffmpeg

####
## audfprint 0.9
## @see https://github.com/dpwe/audfprint
####
RUN curl -LSs https://github.com/hinata/audfprint/archive/0.9.0.tar.gz | tar fxz - -C /usr/local/lib

RUN chmod +x /usr/local/lib/audfprint-0.9.0/audfprint.py
RUN ln -s    /usr/local/lib/audfprint-0.9.0/audfprint.py /usr/bin/audfprint
