FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget build-essential cmake git

RUN wget https://github.com/macroevolution/bamm/archive/v2.5.0.tar.gz && \
    tar zxvf v2.5.0.tar.gz && \
    rm v2.5.0.tar.gz && \
    mv bamm-2.5.0 bamm

RUN cd /bamm && mkdir build && cd build && cmake .. && make -j && \
    cp bamm /usr/bin

RUN mkdir /working_dir
WORKDIR /working_dir
