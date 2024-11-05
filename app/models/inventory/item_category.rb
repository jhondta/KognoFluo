# frozen_string_literal: true

class Inventory::ItemCategory < ApplicationRecord
  # Associations
  belongs_to :item, class_name: 'Inventory::Item', foreign_key: :inventory_item_id
  belongs_to :category, class_name: 'Inventory::Category', foreign_key: :inventory_category_id

  # Validations
  validates :item_id, uniqueness: { scope: :category_id }
end
