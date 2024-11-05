# frozen_string_literal: true

json.array! @maintenance_responsibles, partial: 'maintenance/responsibles/maintenance_responsible', as: :maintenance_responsible
