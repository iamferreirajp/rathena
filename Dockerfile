FROM debian:jessie

# Variáveis configuráveis
ARG prere=yes

# Variáveis para configuração da build
ENV prere ${prere}

# Instalação das dependências
RUN apt-get update && apt-get upgrade -yq

RUN (echo "mysql-server mysql-server/root_password password default" | debconf-set-selections) && (echo "mysql-server mysql-server/root_password_again password default" | debconf-set-selections) 

RUN apt-get install --no-install-recommends -yq apt-utils git make gcc g++ libmysqlclient-dev zlib1g-dev libpcre3-dev mysql-server libmysqlclient-dev ca-certificates

RUN /etc/init.d/mysql start && mysql -u root --password="default" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); DELETE FROM mysql.user WHERE User=''; DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'; FLUSH PRIVILEGES;"

# Preparação do workspace, atualização do sql e iniciar os componentes do servidor

ADD . /rAthena

WORKDIR /rAthena

RUN /etc/init.d/mysql start && mysql -u root --password="default" -e "create database ragnarok; create user 'ragnarok'@'%' identified by 'ragnarok'; grant select,insert,update,delete on ragnarok.* to 'ragnarok'@'%'; FLUSH PRIVILEGES;" && (for F in sql-files/*.sql; do mysql -u root --password="default" ragnarok < $F; done)

RUN ./configure

RUN make clean 

RUN make

EXPOSE 6900 6121 5121

# Comando para executar o mysql e o servidor
CMD /etc/init.d/mysql start && ./athena-start start && /bin/sh
