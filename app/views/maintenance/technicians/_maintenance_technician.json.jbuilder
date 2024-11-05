# frozen_string_literal: true

json.extract! maintenance_technician, :id, :user_id, :specialty, :certificacion_level, :active, :created_at, :updated_at
json.url maintenance_technician_url(maintenance_technician, format: :json)
