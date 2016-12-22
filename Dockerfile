FROM ruby:2.3.1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mysql-client curl unrar-free nginx curl git unzip vim screen telnet nmap mysql-server libmysqlclient-dev redis-server sqlite3 aptitude 
#--no-install-recommends 


RUN mkdir /app

WORKDIR /app

COPY source/puma.rb /app/
COPY job_board/Gemfile /app/Gemfile
COPY job_board/Gemfile.lock /app/Gemfile.lock
COPY docker-entrypoint.sh /entrypoint.sh
COPY docker-start.sh /start.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN service mysql start

RUN gem install puma

RUN gem install rails --version=4.2.1

RUN bundle install 

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/start.sh"]

EXPOSE 3306 3000

