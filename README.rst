How To Use This Repo?
=====================

If You Are A Gentoo User
------------------------

Install eselect-repository package first if it isn't installed on your system:
::

    $ sudo emerge --ask app-eselect/eselect-repository

Next, use eselect repository command to add a local repository named an9wer,
whose path points to the subdirectory *gentoo* of this repo: ::

    $ sudo eselect repository add an9wer /path/to/pkg/gentoo

Finally you can install any Gentoo package in this repo like the following
example: ::

    $ sudo emerge --ask x11-wm/dwm::an9wer

If You Are An Arch User
-----------------------

::

    $ cd arch/<pkg>
    $ makepkg -s
    $ sudo pacman -U <pkg>-*.pkg.tar.zst

If You Are A CentOS/Fedora User
-------------------------------

Check `this link <https://copr.fedorainfracloud.org/coprs/an9wer/>`_ to find
how to install rpm packages in this repo.
