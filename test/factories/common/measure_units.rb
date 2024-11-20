# frozen_string_literal: true

FactoryBot.define do
  factory :common_measure_unit, class: 'Common::MeasureUnit' do
    name { 'Meter' }
    abbreviation { 'm' }
    association :measure_unit_type, factory: :common_measure_unit_type
  end
end
