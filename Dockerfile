#
# Simple etcdctl client
#
# http://github.com/ranger6/etcdctl-docker
#

FROM alpine:latest

MAINTAINER Robert Hyerle <hyerle@hpe.com>

# Set environment variables.
ENV \
  ETCD_VERSION=3.2.7

# fix up alpine for https
RUN \
  apk update && \
  apk add ca-certificates && \
  update-ca-certificates && \
  apk add wget

# Install etcdctl from repository.
RUN \
  cd /tmp && \
  wget https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
  tar zxvf etcd-*-linux-amd64.tar.gz && \
  cp etcd-*-linux-amd64/etcdctl /usr/local/bin/etcdctl && \
  rm -rf etcd-*-linux-amd64 && \
  chmod +x /usr/local/bin/etcdctl

# Set the entrypoint script.
CMD /bin/sh
