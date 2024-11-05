# frozen_string_literal: true

json.extract! maintenance_service, :id, :name, :description, :scheduled_date, :maintenance_frequency_id, :maintenance_responsible_id, :status, :resources, :created_at, :updated_at
json.url maintenance_service_url(maintenance_service, format: :json)
