# frozen_string_literal: true

FactoryBot.define do
  factory :common_country, class: 'Common::Country' do
    common_name { 'MyString' }
    official_name { 'MyString' }
    code_alpha2 { 'US' }
    code_alpha3 { 'USA' }
    phone_code { '+1' }
    tld { '.us' }
    flag_svg { 'MyText' }
    flag_png { '' }
  end
end
