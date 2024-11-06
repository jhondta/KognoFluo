# frozen_string_literal: true

json.extract! common_measure_unit_type, :id, :name, :created_at, :updated_at
json.url common_measure_unit_type_url(common_measure_unit_type, format: :json)
