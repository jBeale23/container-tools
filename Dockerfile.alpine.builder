ARG BASE_IMAGE=alpine:latest

FROM ${BASE_IMAGE}

ARG BASE_IMAGE

# -------- #
# Metadata #
# -------- #
LABEL base_image="${BASE_IMAGE}"
LABEL about.summary="General purpose Alpine lineage container used as a builder for other software libraries."
LABEL about.home="https://github.com/jBeale23/container-tools"
LABEL about.license="MIT"
LABEL about.tags="Alpine,Development"
LABEL maintainer="Josh Beale <jbeale2023@gmail.com"

# --------------------------------------------------------- #
# Install core utilities for installing additional software #
# --------------------------------------------------------- #
RUN <<EOF
  set -e
  apk update
  apk add --no-cache --virtual build-dependencies build-base ca-certificates curl git unzip wget
EOF

# ------------------------------- #
# Install Checksum Utility Script #
# ------------------------------- #
COPY "utilities/inline-checksum/inline-checksum" "/usr/local/bin/"
