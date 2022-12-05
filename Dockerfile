FROM ubuntu:latest
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends build-essential bison flex \
  && apt-get install libbison-dev -y\
  && apt-get install libfl-dev -y\
  && apt-get install make -y\
  && rm -rf /var/lib/apt/lists/* \
  $$
COPY files /home/files
VOLUME /home
WORKDIR /home
