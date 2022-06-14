#!/bin/sh
set -e
echo "Executing container with arguments: ${@}"
CHECK_CMD="${1}"; shift
DOCKER_CONTEXT="/code"

buildah bud --isolation=chroot -t test-target:latest "${DOCKER_CONTEXT}"
buildah push test-target:latest oci:/tmp/test-target

if [ "${CHECK_CMD}" == "trivy" ]; then
    trivy i --input /tmp/test-target
elif [ "${CHECK_CMD}" == "grype" ]; then
    grype oci-dir:/tmp/test-target
else
    echo "Missing command ${CHECK_CMD}"
    exit 1
fi
