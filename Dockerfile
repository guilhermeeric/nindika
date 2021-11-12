FROM ruby:3.0.2

WORKDIR /app/
COPY . .

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt update -q && \
	apt install -y yarn

RUN gem install bundler -v 2.2.25
RUN bundle install
RUN yarn install
RUN apt install -y vim

ENTRYPOINT ["./entrypoint.sh"]
