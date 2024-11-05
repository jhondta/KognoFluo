# frozen_string_literal: true

class Maintenance::Manufacturer < ApplicationRecord
  STATUS = %i[active inactive].freeze
  
  enum :status, STATUS
end
