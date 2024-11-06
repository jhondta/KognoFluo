# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_standard_task_step, class: 'Maintenance::StandardTaskStep' do
    maintenance_standard_task { nil }
    sequence_number { 1 }
    description { nil }
    estimated_duration { 1 }
  end
end
