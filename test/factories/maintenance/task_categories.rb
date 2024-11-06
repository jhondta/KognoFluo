# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_task_category, class: 'Maintenance::TaskCategory' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
  end
end
