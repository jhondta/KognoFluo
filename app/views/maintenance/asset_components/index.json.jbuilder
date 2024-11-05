# frozen_string_literal: true

json.array! @maintenance_asset_components, partial: 'maintenance/asset_components/maintenance_asset_component', as: :maintenance_asset_component
