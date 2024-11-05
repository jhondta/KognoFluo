# frozen_string_literal: true

class CountryTimezone < ApplicationRecord
  belongs_to :country
  belongs_to :timezone

  # Ensure uniqueness of the country_id and timezones_id pair
  validates_uniqueness_of :country_id, scope: :timezone_id
end
