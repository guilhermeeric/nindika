# frozen_string_literal: true

namespace :db do
  task exists: :environment do
    ActiveRecord::Base.connection
  rescue StandardError
    exit 1
  else
    exit 0
  end

  task has_items: :environment do
    Item.any?
  rescue StandardError
    exit 1
  else
    exit 0
  end
end
