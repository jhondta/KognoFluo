# frozen_string_literal: true

json.extract! measure_unit, :id, :name, :abbreviation, :measure_unit_type_id, :created_at, :updated_at
json.url measure_unit_url(measure_unit, format: :json)
