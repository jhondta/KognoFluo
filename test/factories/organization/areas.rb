# frozen_string_literal: true

FactoryBot.define do
  factory :organization_area, class: 'Organization::Area' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    association :plant, factory: :organization_plant
    status { 1 }
  end
end
