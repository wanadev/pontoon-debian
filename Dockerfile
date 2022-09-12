FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3 \
        python3-dev \
        python3-venv \
        curl \
        git \
        libpq-dev \
        && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

WORKDIR /data

CMD ["bash", "make-pontoon-tarball.sh"]
