# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_plan_type, class: 'Maintenance::PlanType' do
    code { 'MyString' }
    name { 'MyString' }
  end
end
