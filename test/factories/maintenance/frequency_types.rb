# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_frequency_type, class: 'Maintenance::FrequencyType' do
    code { 'MyString' }
    name { 'MyString' }
    common_measure_unit { nil }
  end
end
