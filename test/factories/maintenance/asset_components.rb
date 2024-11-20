# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_asset_component, class: 'Maintenance::AssetComponent' do
    association :asset, factory: :maintenance_asset
    name { 'MyString' }
    description { 'MyText' }
    quantity { 1 }
    specifications { '' }
    replacement_period { 1 }
    status { 1 }
  end
end
