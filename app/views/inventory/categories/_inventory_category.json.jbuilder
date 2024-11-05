# frozen_string_literal: true

json.extract! inventory_category, :id, :name, :description, :created_at, :updated_at
json.url inventory_category_url(inventory_category, format: :json)
