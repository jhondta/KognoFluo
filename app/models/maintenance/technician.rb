# frozen_string_literal: true

class Maintenance::Technician < ApplicationRecord
  STATUS = %w[active inactive].freeze
  belongs_to :user
  
  enum :status, STATUS
end
