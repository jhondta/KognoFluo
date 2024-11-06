# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_standard_task, class: 'Maintenance::StandardTask' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    maintenance_task_category { nil }
    estimated_duration { 1 }
    requires_shutdown { false }
    safety_instructions { nil }
  end
end
