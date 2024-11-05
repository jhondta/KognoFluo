# frozen_string_literal: true

json.array! @configuration_plants, partial: 'configuration/plants/configuration_plant', as: :configuration_plant
