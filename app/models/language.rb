# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :country_languages
  has_many :countries, through: :country_languages
end
