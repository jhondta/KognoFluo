# frozen_string_literal: true

FactoryBot.define do
  factory :organization_plant, class: 'Organization::Plant' do
    code { 'MyString' }
    name { 'MyString' }
    address { 'MyText' }
    status { 1 }
  end
end
