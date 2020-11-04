# README

[![Ruby 2.5](https://img.shields.io/badge/ruby-2.5-blue.svg)](https://www.ruby-lang.org/en/news/2019/10/01/ruby-2-5-7-released/)

## Pre Prerequisites:

- equired docker installed

## RUN:

- docker-compose build
- docker-compose run api rails db:create db:migrate db:seed
- docker-compose up

## ROUTES:

### Index Movies: GET
> /movies

### Index Seasons: GET
> /seasons

### Index All media: GET
> /video_footages


### Create Purchase: post
> /purchases?user_id=1
```ruby
{
    "video_footage_id": 3,
    "price": 2.40,
    "video_quality": "SD"
}
```

## TEST:

- docker-compose run api rails db:test:prepare
- docker-compose run api rspec