# frozen_string_literal: true

class Inventory::Warehouse < ApplicationRecord
  # Associations

  # Validations
  validates :name, :location, presence: true
  validates :name, uniqueness: true, length: { minimum: 1, maximum: 100 }
  validates :location, length: { minimum: 1, maximum: 255 }
end
