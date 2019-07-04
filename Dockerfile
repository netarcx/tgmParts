FROM ruby:2.3

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 9000

CMD ["ruby", "parts_server_control.rb", "start", "--ontop"]
