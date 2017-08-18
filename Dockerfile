FROM debian:sid

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y kafkacat krb5-user openssl libssl1.1 libsasl2-2 libsasl2-modules-gssapi-mit --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log /var/log/alternatives.log /var/log/apt/*.log;

ENTRYPOINT ["kafkacat"]
