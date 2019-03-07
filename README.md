[![Maintainability](https://api.codeclimate.com/v1/badges/fda72ff60e3468ed28a4/maintainability)](https://codeclimate.com/github/fabianoleittes/todo-api/maintainability)

# TODO API

## Getting Started

### Install dependencies
After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    $ ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop


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
- [ ] Create items
- [ ] API versioning

## API Endpoints
    $ POST /auth/login
    $ POST /signup
    $ POST /todos

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