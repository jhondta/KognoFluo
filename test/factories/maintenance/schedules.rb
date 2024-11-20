# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_schedule, class: 'Maintenance::Schedule' do
    maintenance_plan { nil }
    scheduled_date { '2024-11-20' }
    status { 1 }
  end
end
