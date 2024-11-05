# frozen_string_literal: true

json.extract! maintenance_responsible, :id, :user_id, :speciality, :status, :created_at, :updated_at
json.url maintenance_responsible_url(maintenance_responsible, format: :json)
