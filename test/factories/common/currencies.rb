# frozen_string_literal: true

FactoryBot.define do
  factory :common_currency, class: 'Common::Currency' do
    name { 'MyString' }
    code_alpha { 'AAA' }
    code_numeric { '111' }
    symbol { '$' }
  end
end
