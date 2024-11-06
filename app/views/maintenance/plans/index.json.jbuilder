# frozen_string_literal: true

json.array! @maintenance_plans, partial: 'maintenance/plans/maintenance_plan', as: :maintenance_plan
