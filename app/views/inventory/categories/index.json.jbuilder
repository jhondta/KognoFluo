# frozen_string_literal: true

json.array! @inventory_categories, partial: 'inventory/categories/inventory_category', as: :inventory_category
