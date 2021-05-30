# README

[![Ruby 2.7.3](https://img.shields.io/badge/ruby-2.7.3-blue.svg)](https://www.ruby-lang.org/en/news/2021/04/05/ruby-2-7-3-released/)


## Pre Prerequisites:

- Required docker installed

## RUN:

- docker-compose build
- docker-compose run api rails db:create db:migrate db:seed
- docker-compose up

## ROUTES:

### Create Session: POST
> /users/sign_in
```ruby
{
    "user" : {
        "email" : "admin@test.com",
        "password" : "12345678"
    }
}
```

### All request must have the header 'Authorization'

### Index Movies: GET
> headers: { "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9." }

> /movies

### Index Seasons: GET
> headers: { "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9." }

> /seasons

### Index All media: GET
> headers: { "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9." }

> /video_footages


### Create Purchase: POST
> headers: { "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9." }

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