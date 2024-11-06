# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_specialty, class: 'Maintenance::Specialty' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
  end
end
