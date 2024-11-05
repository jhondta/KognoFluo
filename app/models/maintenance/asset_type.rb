# frozen_string_literal: true

class Maintenance::AssetType < ApplicationRecord
  STATUS = %i[active inactive].freeze
  
  enum :status, STATUS
end
