# frozen_string_literal: true

require_relative 'currencies'
require_relative 'timezones'
require_relative 'languages'
require_relative 'countries'

puts "Starting default seed..."

Seeds::Currencies.seed
Seeds::Timezones.seed
Seeds::Languages.seed
Seeds::Countries.seed

puts "Default seed completed."
