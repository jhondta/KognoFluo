# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_task, class: 'Maintenance::PlanTask' do
    maintenance_plan { nil }
    sequence_number { 1 }
    name { 'MyString' }
    description { 'MyText' }
    estimated_duration { 1 }
    requires_shutdown { false }
  end
end
