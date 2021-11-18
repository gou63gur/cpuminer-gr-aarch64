FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
  wget \
  curl \
  libjansson4 \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir cpuminer-gr && \
  cd cpuminer-gr && \
  wget https://raw.githubusercontent.com/gou63gur/a/main/cpuminer.tar.gz && \
  tar xvfz cpuminer.tar.gz && \
  rm cpuminer.tar.gz 

WORKDIR cpuminer-gr

CMD ./cpuminer-avx2 -a gr -o ${POOL} -u ${WALLET}

