# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_standard_task_tool, class: 'Maintenance::StandardTaskTool' do
    maintenance_standard_task { nil }
    maintenance_tool { nil }
    quantity { 1 }
  end
end
