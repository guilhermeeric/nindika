#!/bin/bash

rm -rf tmp/cache/assets
rm -f /app/tmp/pids/server.pid
rm -f config/credentials.yml.enc

echo "Creating credentials file..."
EDITOR='cat .env.example >' rails credentials:edit

echo "Checking webpacker..."
if ! bundle exec rails webpacker:verify_install; then
	echo "Installing webpacker..."
	bundle exec rails webpacker:install
fi

echo "Checking database..."
if ! bundle exec rake db:exists; ! bundle exec rake db:has_items; then
	echo "Preparing database..."
	bundle exec rake db:prepare

	echo "Importing game data..."
	bundle exec rake admin:import_data	
fi

echo "Starting application..."
bundle exec rails s -b '0.0.0.0' -p 3000
