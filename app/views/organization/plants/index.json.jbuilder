# frozen_string_literal: true

json.array! @organization_plants, partial: 'organization/plants/organization_plant', as: :organization_plant
