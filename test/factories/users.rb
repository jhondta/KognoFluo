# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@mail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    confirmed_at { Time.now }
  end
end
