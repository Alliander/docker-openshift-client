FROM debian:stretch

COPY openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz istioctl.bz2 argocd-linux-1.1.2.bz2 /run.sh /

RUN tar zxvf /openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz --strip-components 1 -C / && \
  rm /openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
  ln -s /oc /bin/oc && \
  apt-get update && \
  apt-get install -y ca-certificates bzip2 curl netcat-openbsd openssh-client jq vim && \
  bzcat /argocd-linux-1.1.2.bz2 > /usr/local/bin/argocd-1.1.2 && \
  bzcat /istioctl.bz2 > /usr/local/bin/istioctl && \
  rm /argocd-linux-1.1.2.bz2 && \
  rm /istioctl.bz2 && chmod 755 /usr/local/bin/istioctl /usr/local/bin/argocd-1.1.2

ENTRYPOINT ["/run.sh"]
