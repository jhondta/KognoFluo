# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_template_task, class: 'Maintenance::PlanTemplateTask' do
    maintenance_plan_template { nil }
    maintenance_standard_task { nil }
    sequence_number { 1 }
    custom_duration { 1 }
    custom_description { 'MyText' }
  end
end
