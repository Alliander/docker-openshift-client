FROM debian:stretch

COPY openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz /run.sh /

RUN tar zxvf /openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz --strip-components 1 -C / && rm /openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && ln -s /oc /bin/oc && apt-get update && apt-get -y install ca-certificates && apt-get clean

ENTRYPOINT ["/run.sh"]
