# frozen_string_literal: true

json.array! @configuration_production_lines, partial: 'configuration/production_lines/configuration_production_line', as: :configuration_production_line
