FROM debian:stable-slim

# -------- #
# Metadata #
# -------- #
LABEL base_image="debian:stable-slim"
LABEL version="0.1.0"
LABEL about.home="https://github.com/jBeale23/container-tools"
LABEL about.license="MIT"
LABEL maintainer="Josh Beale <jbeale2023@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# --------------------------------------------------------- #
# Install core utilities for installing additional software #
# --------------------------------------------------------- #
RUN <<EOF
set -e
apt-get update
apt-get install -y --no-install-recommends build-essential ca-certificates curl git unzip wget
rm -rf /var/lib/apt/lists/*
EOF

# ------------------------------- #
# Install Checksum Utility Script #
# ------------------------------- #
COPY "checksum" "/usr/local/bin/"
