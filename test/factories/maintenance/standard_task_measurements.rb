# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_standard_task_measurement, class: 'Maintenance::StandardTaskMeasurement' do
    maintenance_standard_task { nil }
    maintenance_measurement_type { nil }
    min_value { '9.99' }
    max_value { '9.99' }
    nominal_value { '9.99' }
    tolerance_percentage { '9.99' }
    is_critical { false }
  end
end
