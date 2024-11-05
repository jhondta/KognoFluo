# frozen_string_literal: true

FactoryBot.define do
  factory :common_country, class: 'Common::Country' do
    common_name { 'MyString' }
    official_name { 'MyString' }
    code_alpha2 { 'MyString' }
    code_alpha3 { 'MyString' }
    phone_code { 'MyString' }
    tld { 'MyString' }
    flag_svg { 'MyText' }
    flag_png { '' }
  end
end
