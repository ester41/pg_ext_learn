#!/bin/bash
set -e

if [ ! -e "/var/lib/pgsql/12/data/base/" ]; then

  # データベースクラスタ作成
  chown postgres:postgres /var/lib/pgsql/12
  mkdir -p /var/lib/pgsql/12/data
  chown postgres:postgres /var/lib/pgsql/12/data
  chmod go-rwx /var/lib/pgsql/12/data
  touch /var/lib/pgsql/12/initdb.log
  chown postgres:postgres /var/lib/pgsql/12/initdb.log
  chmod go-rwx /var/lib/pgsql/12/initdb.log
  su -l postgres -c "/usr/pgsql-12/bin/initdb --pgdata='/var/lib/pgsql/12/data' --auth='ident' -E UTF-8 --locale=C" >> /var/lib/pgsql/12/initdb.log 2>&1 < /dev/null

  # コンフィグ変更
  patch /var/lib/pgsql/12/data/postgresql.conf < /tmp/patch/postgresql.conf.patch
  patch /var/lib/pgsql/12/data/pg_hba.conf < /tmp/patch/pg_hba.conf.patch

  # 追加スクリプト実行
  [ -f /usr/local/bin/docker-entrypoint2.sh ] && bash /usr/local/bin/docker-entrypoint2.sh
fi

rm -rf /tmp/patch*/

exec "$@"
