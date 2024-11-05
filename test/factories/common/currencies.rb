# frozen_string_literal: true

FactoryBot.define do
  factory :common_currency, class: 'Common::Currency' do
    name { 'MyString' }
    code_alpha { 'MyString' }
    code_numeric { 'MyString' }
    symbol { 'MyString' }
  end
end
