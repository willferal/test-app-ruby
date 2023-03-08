FROM ruby:3.0.4-slim

RUN apt-get update; \
    apt-get install -y \
            build-essential \
            iputils-ping \
            libpq-dev \
            memcached \
            net-tools \
            ntpdate \
            tcpdump \
            telnet \
            vim \
            curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install yarn -y

RUN gem install bundler:2.3.17
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN yarn install

#Alterando data e hora do container para Fortaleza
RUN rm -rf /etc/localtime
RUN ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# RUN chmod +x /usr/src/app/entrypoint.sh

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]

# ENTRYPOINT ["./entrypoint.sh"]