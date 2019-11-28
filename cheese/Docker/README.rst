Q: How to build packages by using this Dickerfile?

A: Go back to parent directory of this directory, run the following commands: ::

    # docker build -t pkg Docker
    # docker run  --rm -it --name pkg --mount type=bind,source=$(pwd)/<pkgdir>,target=/home/an9wer/pkg pkg
