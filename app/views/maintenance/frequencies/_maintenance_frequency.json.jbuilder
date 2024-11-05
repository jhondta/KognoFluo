# frozen_string_literal: true

json.extract! maintenance_frequency, :id, :name, :description, :created_at, :updated_at
json.url maintenance_frequency_url(maintenance_frequency, format: :json)
