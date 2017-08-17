FROM debian:stable-20170620

RUN buildDeps='curl ca-certificates build-essential zlib1g-dev python cmake  libsasl2-dev libssl-dev'; \
  set -ex; \
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps --no-install-recommends; \
  rm -rf /var/lib/apt/lists/*; \
  \
  mkdir /usr/src/kafkacat; \
  curl -SLs "https://github.com/edenhill/kafkacat/archive/debian/1.3.1-1.tar.gz" | tar -xzf - --strip-components=1 -C /usr/src/kafkacat; \
  cd /usr/src/kafkacat; \
  ./bootstrap.sh; \
  mv ./kafkacat /usr/local/bin/; \
  \
  rm -rf /usr/src/kafkacat/tmp-bootstrap; \
  apt-get purge -y --auto-remove $buildDeps; \
  echo "Installing runtime dependencies for SSL and SASL support ...."; \
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssl \
    libssl1.1 \
    libsasl2-2 \
    libsasl2-modules-gssapi-mit \
    krb5-user \
    krb5-config; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["kafkacat"]
