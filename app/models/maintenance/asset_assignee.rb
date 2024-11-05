# frozen_string_literal: true

class Maintenance::AssetAssignee < ApplicationRecord
  # Associations
  belongs_to :maintenance_asset
  belongs_to :maintenance_technician
end
