# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_assignment, class: 'Maintenance::Assignment' do
    maintenance_schedule { nil }
    maintenance_technician { nil }
    specialty_type { 1 }
    assigned_hours { '9.99' }
    status { 1 }
  end
end
