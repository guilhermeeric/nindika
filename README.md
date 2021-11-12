# nindika
[![Releases](https://img.shields.io/github/v/release/stephannv/nindika)](https://github.com/stephannv/nindika/releases)
[![CI](https://github.com/stephannv/nindika/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/stephannv/nindika/actions/workflows/ci.yml?query=branch%3Amain++)
[![License](https://img.shields.io/github/license/stephannv/nindika)](https://github.com/stephannv/nindika/blob/main/LICENSE.txt)

[nindika](https://nindika.com) is a web application focused on Brazilian market that helps users to discover their next Nintendo Switch game.

## Development
### System dependencies
**Docker**

## Getting Started
1. Clone project

        $ git@github.com:guilhermeeric/nindika.git

2. Change directory to `nindika`

        $ cd nindika

3. Fill `.env.example` with Nintendo API info. These can be found by looking at requests on Nintendo eShop website:

        nintendo_algolia_application_id: 'XXXXX'
        nintendo_algolia_api_key: 'XXXXXX

4. Run project with Docker Compose:

        $ docker-compose up

5. Visit [http://localhost:3000](http://localhost:3000)

## Run tests

    $ bundle exec rspec spec

## Run linter

    $ bundle exec rubocop

## Run vulnerability scanner

    $ brakeman -A -z -q

## License

nindika is licensed under the [MIT](https://github.com/stephannv/nindika/blob/main/LICENSE.txt) license.

## Copyright
Copyright 2021, nindika.
