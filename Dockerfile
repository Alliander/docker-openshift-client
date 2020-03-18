FROM debian:stretch

COPY openshift-client-linux-4.3.5.tar.gz istioctl.bz2 argocd-linux-amd64 /run.sh /

RUN tar zxvf /openshift-client-linux-4.3.5.tar.gz    -C / && \
  rm /openshift-client-linux-4.3.5.tar.gz && \
  ln -s /oc /bin/oc && \
  apt-get update && \
  apt-get install -y ca-certificates bzip2 curl netcat-openbsd openssh-client jq vim && \
  cp argocd-linux-amd64 /usr/local/bin/argocd && \
  bzcat /istioctl.bz2 > /usr/local/bin/istioctl && \
  rm /istioctl.bz2 && chmod 755 /usr/local/bin/istioctl && chmod 755 /usr/local/bin/argocd

ENTRYPOINT ["/run.sh"]
