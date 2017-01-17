FROM ubuntu:16.04
RUN apt-get -y -qq update
RUN apt-get -y -qq upgrade
RUN apt-get install -y \
            gcc-5-base\
            libgcc-5-dev\
            g++\
            cmake\
            git
RUN apt-get install -y \
            freeglut3-dev
WORKDIR /home
RUN git clone https://github.com/Ethiy/lib3ds.git
WORKDIR lib3ds/
RUN mkdir build && mkdir build/xenial
WORKDIR build/xenial
RUN cmake ../..
RUN make -j4
