# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_schedule, class: 'Maintenance::Schedule' do
    maintenance_plan { nil }
    planned_date { '2024-11-05 20:37:36' }
    estimated_duration { 1 }
    status { 1 }
    priority { 'MyString' }
    notes { nil }
  end
end
