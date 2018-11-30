FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget build-essential cmake

RUN git clone https://github.com/macroevolution/bamm.git --depth 10

RUN cd /bamm && mkdir build && cd build && cmake .. && make -j && \
    cp bamm /usr/bin

RUN mkdir /working_dir
WORKDIR /working_dir
