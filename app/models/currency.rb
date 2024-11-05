# frozen_string_literal: true

class Currency < ApplicationRecord
  has_many :country_currencies
  has_many :countries, through: :country_currencies
end
