FROM ruby:2.6.1
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev
ENV LC_ALL C.UTF-8
ENV TZ Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME

ADD Gemfile $APP_HOME/Gemfile

RUN cd $APP_HOME && bundle install

ADD . $APP_HOME

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh
WORKDIR $APP_HOME
ENTRYPOINT ["docker-entrypoint.sh"]
