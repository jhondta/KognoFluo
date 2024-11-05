# frozen_string_literal: true

json.array! @maintenance_services, partial: 'maintenance/services/maintenance_service', as: :maintenance_service
