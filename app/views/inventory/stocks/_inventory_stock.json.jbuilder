# frozen_string_literal: true

json.extract! inventory_stock, :id, :inventory_item_id, :inventory_warehouse_id, :quantity, :minimum, :maximum, :reorder_quantity, :created_at, :updated_at
json.url inventory_stock_url(inventory_stock, format: :json)
