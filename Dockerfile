FROM ruby:3.2.3 AS builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y nodejs build-essential

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 4 --retry 5

COPY . .

FROM ruby:3.2.3

WORKDIR /app

RUN apt-get update && \
    apt-get install -y nodejs

COPY --from=builder /app /app

RUN bundle install --jobs 4 --retry 5

ENV PATH="/app/bin:/app/vendor/bundle/bin:$PATH"

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
