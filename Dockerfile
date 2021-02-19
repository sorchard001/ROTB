FROM jamieleecho/coco-dev:0.34
MAINTAINER Jamie Cho version: 0.1

# Install asm6809
RUN apt-get install -y autoconf && \
  git clone https://www.6809.org.uk/git/asm6809.git && \
  cd asm6809 && \
  aclocal && \
  autoconf && \
  (automake --add-missing --foreign || autoreconf || automake --add-missing --foreign) && \
  ./configure && \
  make && \
  make install

# Install rotb
RUN mkdir rotb
WORKDIR rotb
COPY *.s *.asm *.bin ./
COPY waves ./waves
