# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_asset_assignee, class: 'Maintenance::AssetAssignee' do
    association :asset, factory: :maintenance_asset
    association :technician, factory: :maintenance_technician
  end
end
