# ----------------------------------
# UT99 Dockerfile
# Environment: Ubuntu:24.04
# Minimum Panel Version: 0.0.0
# ----------------------------------
FROM        ubuntu:24.04

LABEL maintainer="Ryan Ward <itsupport@texedo.net>"

# Install Dependencies
RUN         dpkg --add-architecture i386 && \
            apt update && \
            apt upgrade -y && \
            apt install -y curl software-properties-common apt-transport-https lib32gcc-s1  && \
            apt install -y libstdc++5 libstdc++5:i386 && \
            apt clean && \
            useradd -d /home/container -m container && \
            cd /home/container

USER        container
ENV         HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]

