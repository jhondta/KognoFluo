# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_asset, class: 'Maintenance::Asset' do
    code { 'MyString' }
    name { 'MyString' }
    association :type, factory: :maintenance_asset_type
    association :production_line, factory: :organization_production_line
    association :manufacturer, factory: :maintenance_manufacturer
    model { 'MyString' }
    serial_number { 'MyString' }
    manufacturing_date { '2024-11-05' }
    purchase_date { '2024-11-05' }
    warranty_expiration { '2024-11-05' }
    status { 1 }
    criticality_level { 1 }
    technical_specs { 'MyText' }
    physical_location { 'MyString' }
  end
end
