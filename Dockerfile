FROM ruby:2.6.1

ENV LC_ALL C.UTF-8
ENV TZ Asia/Taipei
ENV APP_HOME /app

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile ./
COPY Gemfile.lock ./
RUN gem update --system
RUN gem uninstall bundler
RUN rm /usr/local/bin/bundle
RUN rm /usr/local/bin/bundler
RUN gem install bundler
RUN bundle install

COPY . ./

EXPOSE 3000
ENTRYPOINT ["bundle", "exec"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
