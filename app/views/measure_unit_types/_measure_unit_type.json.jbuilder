# frozen_string_literal: true

json.extract! measure_unit_type, :id, :name, :created_at, :updated_at
json.url measure_unit_type_url(measure_unit_type, format: :json)
