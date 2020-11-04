# README

[![Ruby 2.7.1](https://img.shields.io/badge/ruby-2.7.1-blue.svg)](https://www.ruby-lang.org/es/news/2020/03/31/ruby-2-7-1-released/)


## Pre Prerequisites:

- Required docker installed

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