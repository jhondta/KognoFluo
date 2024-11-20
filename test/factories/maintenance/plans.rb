# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan, class: 'Maintenance::Plan' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    plan_type { 1 }
    status { 1 }
    criticality { 1 }
    frequency_type { 1 }
    frequency_value { 1 }
    estimated_duration { 1 }
    requires_shutdown { false }
    maintenance_asset { nil }
    maintenance_asset_component { nil }
    start_date { '2024-11-19 22:41:11' }
  end
end
