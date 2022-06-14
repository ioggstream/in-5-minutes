# Simple imagescan tutorial

This repo contains a simple imagescan tutorial
based on buildah, trivy and grype.

Buildah is a go binary that can build OCI (container) images
without running a docker daemon. Still it requires
a privileged container.

Trivy and grype are two different FLOSS binaries
that scan OCI images for vulnerabilities.

## This tutorial

This tutorial is based on Docker :)
so you don't need to install anything on
your laptop.

The entrypoint.sh shows the building flow,
that requires a privileged container.

Once the container image is built, you can
analyze it with trivy or grype.

## Playing

Just run the image playground with

        docker-compose up scan

You can run the image on your directory with

        docker run --rm --privileged \
            -v $PWD:/code  \
            imagescan_scan grype
