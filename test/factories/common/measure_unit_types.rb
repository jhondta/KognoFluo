# frozen_string_literal: true

FactoryBot.define do
  factory :common_measure_unit_type, class: 'Common::MeasureUnitType' do
    name { 'MyString' }
  end
end
