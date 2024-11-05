# frozen_string_literal: true

json.array! @maintenance_frequencies, partial: 'maintenance/frequencies/maintenance_frequency', as: :maintenance_frequency
