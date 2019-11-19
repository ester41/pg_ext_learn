FROM centos:7
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7; \
    yum -y update; \
    yum install -y perl glibc wget git logrotate cronie tmpwatch patch; \
    yum clean all; \
    localedef -i ja_JP -f UTF-8 ja_JP.UTF-8; \
    echo 'LANG="ja_JP.UTF-8"' > /etc/locale.conf; \
    echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock; \
    rm -f /etc/localtime; \
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime; \
    systemctl mask getty@tty1.service; \
    systemctl mask serial-getty@ttyS0.service;
ENV LANG ja_JP.UTF-8
RUN yum install -y https://download.postgresql.org/pub/repos/yum/12/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm; \
    yum install -y epel-release; \
    yum install -y llvm5.0 llvm5.0-libs postgresql12-server postgresql12-contrib postgresql12-devel postgresql12-libs postgresql12-llvmjit; \
    systemctl enable postgresql-12

# コンフィグファイルのパッチ
RUN mkdir /tmp/patch/
COPY postgresql/postgresql.conf.patch /tmp/patch/postgresql.conf.patch
COPY postgresql/pg_hba.conf.patch /tmp/patch/pg_hba.conf.patch

# 永続化対応
VOLUME "/var/lib/pgsql/12"
COPY postgresql/docker-entrypoint.sh /usr/local/bin/
COPY postgresql/process-stop.sh /usr/local/bin/
COPY postgresql/logrotate_pg /etc/cron.daily/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["/usr/sbin/init"]
