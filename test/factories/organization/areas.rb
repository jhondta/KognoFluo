# frozen_string_literal: true

FactoryBot.define do
  factory :organization_area, class: 'Organization::Area' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    organization_plant { nil }
    status { 1 }
  end
end
