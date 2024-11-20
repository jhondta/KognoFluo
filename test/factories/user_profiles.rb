# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    association :user, factory: :user
    first_name { 'MyString' }
    last_name { 'MyString' }
    birth_date { '2024-11-05' }
    gender { 1 }
    avatar { nil }
  end
end
