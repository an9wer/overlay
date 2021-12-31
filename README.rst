How to Use This Repo?
=====================

If You Are a Gentoo User
------------------------

First, install eselect-repository package if it isn't installed on your system:
::

    $ sudo emerge --ask app-eselect/eselect-repository

Next, use eselect repository command to add a local repository named an9wer,
whose path points to the subdirectory *gentoo* in this repo: ::

    $ sudo eselect repository create an9wer /path/to/pkg/gentoo

Finally, install some Gentoo package in this repo as follows: ::

    $ sudo emerge --ask x11-wm/dwm::an9wer

If You Are an Arch User
-----------------------

::

    $ cd arch/<pkg>
    $ makepkg -s
    $ sudo pacman -U <pkg>-*.pkg.tar.zst

If You Are a CentOS/Fedora User
-------------------------------

Check `this link <https://copr.fedorainfracloud.org/coprs/an9wer/>`_ to find
how to install rpm packages in this repo.
