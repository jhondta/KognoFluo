# frozen_string_literal: true

json.array! @maintenance_asset_types, partial: 'maintenance/asset_types/maintenance_asset_type', as: :maintenance_asset_type
