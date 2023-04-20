ARG BASE_DISTRO=SPECIFY_ME

FROM crops/yocto:$BASE_DISTRO-base

USER root

RUN apt update && apt install -y \
    rsync \
    curl \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

# Make password for user and assign to group sudo to enable rootfs extraction
RUN usermod -p `echo "1234" | openssl passwd -stdin` yoctouser
RUN usermod -G sudo yoctouser

USER yoctouser
ENV LANG=en_US.UTF-8
