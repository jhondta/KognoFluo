# frozen_string_literal: true

FactoryBot.define do
  factory :maintenance_tool, class: 'Maintenance::Tool' do
    code { 'MyString' }
    name { 'MyString' }
    description { 'MyText' }
    calibration_required { false }
  end
end
