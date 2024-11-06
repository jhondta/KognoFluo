# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan, class: 'Maintenance::Plan' do
    maintenance_plan_template { nil }
    maintenance_asset { nil }
    component { nil }
    status { 1 }
    start_date { '2024-11-05' }
    last_execution_date { '2024-11-05' }
    next_execution_date { '2024-11-05' }
    notes { nil }
  end
end
