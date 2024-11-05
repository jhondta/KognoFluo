# frozen_string_literal: true

class Timezone < ApplicationRecord
  has_many :country_timezones
  has_many :countries, through: :country_timezones
end
