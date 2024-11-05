# frozen_string_literal: true

FactoryBot.define do
  factory :organization_production_line, class: 'Organization::ProductionLine' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    configuration_area { nil }
    status { 1 }
  end
end
