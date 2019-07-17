FROM registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:v1.14.4
RUN apt-get update &&  apt-get -y install apt-transport-https gnupg2 wget curl
RUN curl https://download.ceph.com/keys/release.asc | apt-key add - && \
    echo deb http://mirrors.aliyun.com/ceph/debian-luminous/ stretch main | tee /etc/apt/sources.list.d/ceph.list && \
    apt-get update &&  apt-get install -q -y ceph-common && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
