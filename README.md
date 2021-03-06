[![Maintainability](https://api.codeclimate.com/v1/badges/fda72ff60e3468ed28a4/maintainability)](https://codeclimate.com/github/fabianoleittes/todo-api/maintainability)

# TODO API

## Getting Started

### Option 1: Install dependencies

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    $ ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

### Option 2: Run Docker container
After you have cloned this repo, install [Docker] and [Docker Compose], and then run:

    $ docker-compose build
    $ docker-compose up

[Docker]: https://docs.docker.com/engine/installation/
[Docker Compose]: https://docs.docker.com/compose/install/

### Heroku Setup
After setting up, you can run the application using [Heroku Local]:

    $ heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

### API

### What's included

### Features

What's in Version V1

- [x] RESTful API
- [x] JSON Schema implementation
- [x] RSpec testing
- [x] Setup scripts
- [x] Usage of http methods/verbs
- [x] Structured endpoints
- [x] Return appropriate status code
- [x] JWT Token Based Authentication
- [x] Create users
- [x] Create todos
- [x] Create items
- [x] API versioning


URL / ENDPOINT    |    VERB    |    DESCRIPTION   
----------------- | ---------- | -------------- 
/v1/signup            |    POST    | Create user
/v1/auth/login       |    POST    | Generate token      
/v1/todos            |    POST     | Create todo
/v1/todos |    GET     | Return all todos      
/v1/todos/:id |    PUT     | Update todo
/v1/todos/:id |    GET     | Show todo
/v1/todos/:id |    PUT     | Destroy todo      
/v1/todos/:id/items |   POST   | Create item
/v1/todos/:id/items |    GET     | Return all items      
/v1/todos/:id/items/:id |    PUT     | Update item
/v1/todos/:id/items/:id |    GET     | Show item
/v1/todos/:id/items/:id |    PUT     | Destroy item      

## To run testing
    $ bin/rspec

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fabianoleittes/todo-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).