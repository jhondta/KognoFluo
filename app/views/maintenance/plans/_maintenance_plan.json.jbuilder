# frozen_string_literal: true

json.extract! maintenance_plan, :id, :code, :name, :description, :plan_type, :status, :criticality, :frequency_type, :frequency_value, :estimated_duration, :requires_shutdown, :maintenance_asset_id, :maintenance_asset_component_id, :start_date, :created_at, :updated_at
json.url maintenance_plan_url(maintenance_plan, format: :json)
