FROM debian:8

ARG VERSION=1.5.1
ARG WEB_VERSION=0.5.12
ARG SECURITY_SCANNER_VERSION=0.0.1

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN mkdir /arachni && \
    mkdir /arachni/ctm_security_scanner && \
    wget -qO- https://github.com/Arachni/arachni/releases/download/v${VERSION}/arachni-${VERSION}-${WEB_VERSION}-linux-x86_64.tar.gz | tar xvz -C /arachni --strip-components=1 && \
    wget -qO- https://github.com/ZukkyBaig/ctm_security_scanner/archive/${SECURITY_SCANNER_VERSION}.tar.gz | tar xvz -C /arachni/ctm_security_scanner --strip-components=1
 
WORKDIR /arachni
EXPOSE 9292
