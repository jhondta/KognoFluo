# frozen_string_literal: true

json.array! @maintenance_asset_assignees, partial: 'maintenance/asset_assignees/maintenance_asset_assignee', as: :maintenance_asset_assignee
