# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_measurement_type, class: 'Maintenance::MeasurementType' do
    code { 'MyString' }
    name { 'MyString' }
    common_measure_unit { nil }
  end
end
