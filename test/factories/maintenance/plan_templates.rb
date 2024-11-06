# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_template, class: 'Maintenance::PlanTemplate' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    maintenance_plan_type { nil }
    maintenance_frequency_type { nil }
    frequency_value { 1 }
    estimated_duration { 1 }
    requires_shutdown { false }
    criticality { 1 }
    safety_requirements { nil }
  end
end
