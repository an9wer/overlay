from archlinux/base

SHELL ["/bin/bash", "-c"]

USER root:root

WORKDIR /root
RUN pacman -Syu --needed --noconfirm \
    binutils \
    fakeroot \
    sudo \
    gawk \
    grep \
    file
RUN groupadd -f wheel && \
    useradd -g wheel -s /bin/bash -m an9wer && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/an9wer

USER an9wer:wheel

WORKDIR /home/an9wer
RUN mkdir /home/an9wer/pkg

WORKDIR /home/an9wer/pkg
ENTRYPOINT ["makepkg", "-s", "--noconfirm"]
