# frozen_string_literal: true

class Inventory::Stock < ApplicationRecord
  # Associations
  belongs_to :item, class_name: 'Inventory::Item', foreign_key: 'inventory_item_id'
  belongs_to :warehouse, class_name: 'Inventory::Warehouse', foreign_key: 'inventory_warehouse_id'

  # Validations
  validates :inventory_item_id, :inventory_warehouse_id, :quantity, :minimum,
            :maximum, :reorder_quantity, presence: true
  validates :inventory_item_id, uniqueness: { scope: :inventory_warehouse_id }
  validates :quantity, :minimum, :maximum, :reorder_quantity,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
