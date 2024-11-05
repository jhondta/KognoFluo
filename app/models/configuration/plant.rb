# frozen_string_literal: true

class Configuration::Plant < ApplicationRecord
  # Associations
  has_many :areas, class_name: 'Configuration::Area',
           foreign_key: :configuration_plant_id
end
