FROM postgres:9.6
RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8
RUN mkdir /var/lib/postgresql/data/oauth && chmod a+rw /var/lib/postgresql/data/oauth
ADD scripts/init-user-db.sh /docker-entrypoint-initdb.d
ENV LANG de_DE.utf8
ENV PGDATA /var/lib/postgresql/data/oauth
