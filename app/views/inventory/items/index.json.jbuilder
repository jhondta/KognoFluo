# frozen_string_literal: true

json.array! @inventory_items, partial: 'inventory/items/inventory_item', as: :inventory_item
