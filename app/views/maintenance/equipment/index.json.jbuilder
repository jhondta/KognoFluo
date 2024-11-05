# frozen_string_literal: true

json.array! @maintenance_equipment, partial: 'maintenance/equipment/maintenance_equipment', as: :maintenance_equipment
