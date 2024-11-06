# frozen_string_literal: true

FactoryBot.define do
  factory :common_measure_unit, class: 'Common::MeasureUnit' do
    name { 'MyString' }
    abbreviation { 'MyString' }
    common_measure_unit_type { nil }
  end
end
