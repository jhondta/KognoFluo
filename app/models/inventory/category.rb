# frozen_string_literal: true

class Inventory::Category < ApplicationRecord
  # Associations
  has_many :item_categories, class_name: 'Inventory::ItemCategory'
  has_many :items, through: :item_categories

  # Validations
  validates :name, :description, presence: true
  validates :name, uniqueness: true, length: { minimum: 1, maximum: 100 }
  validates :description, length: { minimum: 1, maximum: 255 }
end
