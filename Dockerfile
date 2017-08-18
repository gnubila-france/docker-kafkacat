FROM debian:sid

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y kafkacat --no-install-recommends

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y krb5-user

RUN  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y openssl libssl1.1 libsasl2-2 libsasl2-modules-gssapi-mit
#  && rm -rf /var/lib/apt/lists/*;

ENTRYPOINT ["kafkacat"]
