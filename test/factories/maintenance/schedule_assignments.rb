# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_schedule_assignment, class: 'Maintenance::ScheduleAssignment' do
    maintenance_schedule { nil }
    maintenance_technician { nil }
    maintenance_specialty { nil }
    assigned_hours { '9.99' }
    status { 1 }
    notes { nil }
  end
end
