# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_manufacturer, class: 'Maintenance::Manufacturer' do
    code { 'MyString' }
    name { 'MyString' }
    status { 1 }
    website { 'MyString' }
    support_phone { 'MyString' }
    suport_email { 'MyString' }
    notes { 'MyText' }
  end
end
