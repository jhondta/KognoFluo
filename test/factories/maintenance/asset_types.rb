# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_asset_type, class: 'Maintenance::AssetType' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    status { 1 }
  end
end
