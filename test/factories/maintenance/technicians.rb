# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_technician, class: 'Maintenance::Technician' do
    user { nil }
    specialty { 'MyString' }
    certificacion_level { 'MyString' }
    status { 1 }
  end
end
