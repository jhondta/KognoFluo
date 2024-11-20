# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_resource, class: 'Maintenance::PlanResource' do
    maintenance_plan { nil }
    resource_type { 1 }
    maintenance_tool { nil }
    specialty_type { 1 }
    quantity { '9.99' }
    hours_required { '9.99' }
  end
end
