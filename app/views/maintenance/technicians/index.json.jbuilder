# frozen_string_literal: true

json.array! @maintenance_technicians, partial: 'maintenance/technicians/maintenance_technician', as: :maintenance_technician
