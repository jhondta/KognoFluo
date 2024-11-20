# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_asset_document, class: 'Maintenance::AssetDocument' do
    association :asset, factory: :maintenance_asset
    document_type { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    version { 'MyString' }
    expiration_date { '2024-11-05' }
    status { 1 }
  end
end
