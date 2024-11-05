# frozen_string_literal: true

json.extract! common_language, :id, :name, :native_name, :code_iso_639_1, :code_iso_639_2, :created_at, :updated_at
json.url common_language_url(common_language, format: :json)
