# frozen_string_literal: true

json.extract! inventory_item_category, :id, :inventory_item_id, :inventory_category_id, :created_at, :updated_at
json.url inventory_item_category_url(inventory_item_category, format: :json)
