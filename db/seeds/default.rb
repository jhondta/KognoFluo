# frozen_string_literal: true

require_relative 'currencies'
require_relative 'timezones'
require_relative 'languages'
require_relative 'countries'
require_relative 'users'

puts "Starting default seed..."

Seeds::Currencies.seed
Seeds::Timezones.seed
Seeds::Languages.seed
Seeds::Countries.seed
Seeds::Users.seed

puts "Default seed completed."
