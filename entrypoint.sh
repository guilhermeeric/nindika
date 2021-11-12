#!/bin/bash

rm -rf tmp/cache/assets
rm -f /app/tmp/pids/server.pid
rm -f config/credentials.yml.enc

echo "Creating credentials file..."
EDITOR='cat .env.example >' rails credentials:edit

echo "Installing webpacker..."
bundle exec rails webpacker:install

echo "Creating database..."
bundle exec rake db:setup

echo "Importing game data..."
bundle exec rake admin:import_data

echo "Starting application..."
bundle exec rails s -b '0.0.0.0' -p 3000