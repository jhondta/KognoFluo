# frozen_string_literal: true

class CountryCurrency < ApplicationRecord
  belongs_to :country
  belongs_to :currency
end
