# frozen_string_literal: true

json.extract! common_measure_unit, :id, :name, :abbreviation, :common_measure_unit_type_id, :created_at, :updated_at
json.url common_measure_unit_url(common_measure_unit, format: :json)
