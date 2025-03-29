# Container image that runs your code
FROM docker.io/library/ubuntu:24.04

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY --chmod=0755 entrypoint.sh /opt/my-runner/entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/opt/my-runner/entrypoint.sh"]
