# frozen_string_literal: true

json.extract! language, :id, :name, :iso_code2, :iso_code3, :created_at, :updated_at
json.url language_url(language, format: :json)
