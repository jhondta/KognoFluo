# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_task_measurement, class: 'Maintenance::PlanTaskMeasurement' do
    maintenance_plan_task { nil }
    name { 'MyString' }
    measurement_type { 1 }
    nominal_value { '9.99' }
    min_value { '9.99' }
    max_value { '9.99' }
    tolerance_percentage { '9.99' }
    is_critical { false }
  end
end
