# frozen_string_literal: true

class Configuration::Area < ApplicationRecord
  # Associations
  has_many :production_lines, class_name: 'Configuration::ProductionLine',
           foreign_key: :configuration_area_id
  belongs_to :plant, class_name: 'Configuration::Plant',
             foreign_key: :configuration_plant_id
end
