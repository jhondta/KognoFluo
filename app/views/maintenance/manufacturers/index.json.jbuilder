# frozen_string_literal: true

json.array! @maintenance_manufacturers, partial: 'maintenance/manufacturers/maintenance_manufacturer', as: :maintenance_manufacturer
