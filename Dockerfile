FROM debian:buster

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
      awscli \
      ca-certificates \
      curl \
      git \
      groff \
      jq \
      sudo \
      unzip \
 && rm -rf /var/lib/apt/lists/*

ARG TF_VERS=0.12.28
RUN curl "https://releases.hashicorp.com/terraform/${TF_VERS}/terraform_${TF_VERS}_linux_amd64.zip" -o terraform.zip \
 && unzip -p terraform.zip terraform > /usr/local/bin/terraform \
 && chmod +x /usr/local/bin/terraform \
 && rm terraform.zip

ARG TFCONFIG_VERS=v1.0.0
ADD https://raw.githubusercontent.com/vexingcodes/terraform-aws-tfconfig/${TFCONFIG_VERS}/tfconfig /usr/local/bin/
RUN chmod +rx /usr/local/bin/tfconfig

ENTRYPOINT [ "sleep", "infinity" ]
