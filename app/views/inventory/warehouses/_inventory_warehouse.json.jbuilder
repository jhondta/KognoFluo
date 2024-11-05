# frozen_string_literal: true

json.extract! inventory_warehouse, :id, :name, :location, :created_at, :updated_at
json.url inventory_warehouse_url(inventory_warehouse, format: :json)
