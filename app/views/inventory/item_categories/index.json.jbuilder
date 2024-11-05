# frozen_string_literal: true

json.array! @inventory_item_categories, partial: 'inventory/item_categories/inventory_item_category', as: :inventory_item_category
