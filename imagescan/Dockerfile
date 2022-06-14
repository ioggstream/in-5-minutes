#
# This Dockerfile generates a container for building and
#  validating container images.
#  Once built with buildah and pushed on a specific path,
#
#  	buildah push my-image-tag oci:/code/testme.tar
#
#  you can validate images with
#
# 	trivy i --input /code/testme.tar
#
#  or
#
# 	grype oci-dir:/code/testme.tar
FROM buildah/buildah
RUN apk add curl
RUN wget https://github.com/aquasecurity/trivy/releases/download/v0.28.1/trivy_0.28.1_Linux-64bit.tar.gz && tar xf trivy_0.28.1_Linux-64bit.tar.gz && mv trivy /usr/local/bin
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin
COPY entrypoint.sh /entrypoint.sh
WORKDIR /code
ENTRYPOINT ["/entrypoint.sh"]
CMD ["grype"]
