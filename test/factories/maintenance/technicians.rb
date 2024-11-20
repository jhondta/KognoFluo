# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_technician, class: 'Maintenance::Technician' do
    association :user, factory: :user
    specialty { 'MyString' }
    certification_level { 'MyString' }
    status { 1 }
  end
end
