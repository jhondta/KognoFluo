# frozen_string_literal: true

json.array! @maintenance_assets, partial: 'maintenance/assets/maintenance_asset', as: :maintenance_asset
