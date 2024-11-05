# frozen_string_literal: true

json.extract! inventory_item, :id, :name, :sku, :description, :measure_unit_id, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
