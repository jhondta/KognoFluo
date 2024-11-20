# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan, class: 'Maintenance::Plan' do
    association :asset, factory: :maintenance_asset
    association :component, factory: :maintenance_asset_component
    status { 1 }
    start_date { '2024-11-05' }
    last_execution_date { '2024-11-05' }
    next_execution_date { '2024-11-05' }
    notes { nil }
  end
end
