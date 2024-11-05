# frozen_string_literal: true

class CountryLanguage < ApplicationRecord
  belongs_to :country
  belongs_to :language
end
