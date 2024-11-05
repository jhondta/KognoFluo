# frozen_string_literal: true

class Organization::Area < ApplicationRecord
  STATUS = %i[active inactive].freeze
  belongs_to :plant, class_name: 'Organization::Plant',
             foreign_key: :organization_plant_id
  has_many :production_lines

  enum :status, STATUS
end
