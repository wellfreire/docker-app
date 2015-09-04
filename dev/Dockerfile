FROM debian:jessie

RUN apt-get update

# Installs basic tools
RUN apt-get install -y curl

# Installs NodeJS and NPM
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get -y install nodejs
RUN npm install npm -g
RUN npm -v

ADD run.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run.sh

CMD ["run.sh"]