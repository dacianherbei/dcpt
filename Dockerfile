FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y build-essential

RUN apt-get install -y git

RUN apt-get install -y subversion

RUN apt-get install -y cmake

RUN apt-get install -y python3 python3-distutils

COPY get_cmake /third_party/

RUN chmod +x /third_party/get_cmake

RUN /third_party/get_cmake

COPY get_llvm /third_party/

RUN chmod +x /third_party/get_llvm

RUN /third_party/get_llvm

RUN cd llvm-build && make -j8

RUN cd llvm-build && make install

ENV CC /usr/local/bin/clang

ENV CXX /usr/local/bin/clang++

COPY get_googletest /third_party/

RUN chmod +x /third_party/get_googletest

RUN /third_party/get_googletest