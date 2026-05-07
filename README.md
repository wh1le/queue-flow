# QueueFlow

A StackOverflow-inspired Q&A platform built with Ruby on Rails.

This project was built as part of the [Thinknetica](https://thinknetica.com/) professional development course, which I started when I was 1 year into my first Rails job.

Mentors: [Vladimir Dementyev (@palkan)](https://github.com/palkan) ([Evil Martians](https://evilmartians.com/)), [Vladimir Kurennov (@vkurennov)](https://github.com/vkurennov) ([Thinknetica](https://thinknetica.com/), CTO)

## Features

- Questions and answers with voting system
- Best answer selection
- Comments on questions and answers
- File attachments
- Real-time updates via WebSockets (PrivatePub)
- Full-text search (Sphinx)
- OAuth authentication (Facebook, Twitter)
- REST API with OAuth2 (Doorkeeper)
- Email notifications with subscriptions
- Background jobs (Sidekiq)
- Authorization policies (Pundit)

## Installation

```bash
# Install Ruby 2.3.0 with rbenv
rbenv install 2.3.0
rbenv local 2.3.0

# Install dependencies
bundle install

# Setup database
cp config/database.yml.example config/database.yml
rake db:create db:migrate db:seed

# Setup secrets
cp config/secrets.yml.sample config/secrets.yml

# Start Redis
redis-server &

# Start Sidekiq
bundle exec sidekiq &

# Start the server
bundle exec rails server
```

## Tech Stack

- Ruby 2.3 / Rails 4.2
- PostgreSQL
- Redis
- Sidekiq
- Sphinx (thinking-sphinx)
- Devise + OmniAuth
- RSpec + Capybara
- Capistrano deployment
- Unicorn
