# frozen_string_literal: true

class Maintenance::AssetDocument < ApplicationRecord
  # Constants
  # Associations
  belongs_to :asset, class_name: 'Maintenance::Asset',
             foreign_key: :maintenance_asset_id

  # Validations

  # Scopes
  # Callbacks
end
