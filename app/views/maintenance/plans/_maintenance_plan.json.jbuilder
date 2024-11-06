# frozen_string_literal: true

json.extract! maintenance_plan, :id, :maintenance_plan_template_id, :maintenace_asset_id, :component_id, :status, :start_date, :last_execution_date, :next_execution_date, :notes, :created_at, :updated_at
json.url maintenance_plan_url(maintenance_plan, format: :json)
json.notes maintenance_plan.notes.to_s
