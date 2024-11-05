# frozen_string_literal: true

class Organization::Plant < ApplicationRecord
  STATUS = %w[active inactive].freeze
  has_many :areas
  
  enum :status, STATUS
end
