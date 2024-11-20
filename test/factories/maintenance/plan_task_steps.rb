# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_task_step, class: 'Maintenance::PlanTaskStep' do
    maintenance_plan_task { nil }
    sequence_number { 1 }
    description { 'MyText' }
  end
end
