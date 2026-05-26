ARG BASE_IMAGE=debian:stable-slim

FROM ${BASE_IMAGE}

ARG BASE_IMAGE

# -------- #
# Metadata #
# -------- #
LABEL base_image="${BASE_IMAGE}"
LABEL about.summary="General purpose Debian lineage container used as a builder for other software libraries."
LABEL about.home="https://github.com/jBeale23/container-tools"
LABEL about.license="MIT"
LABEL about.tags="Debian,Development"
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
