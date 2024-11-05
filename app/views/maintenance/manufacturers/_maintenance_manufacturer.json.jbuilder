# frozen_string_literal: true

json.extract! maintenance_manufacturer, :id, :code, :name, :status, :website, :support_phone, :suport_email, :notes, :created_at, :updated_at
json.url maintenance_manufacturer_url(maintenance_manufacturer, format: :json)
