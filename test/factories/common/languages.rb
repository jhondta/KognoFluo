# frozen_string_literal: true

FactoryBot.define do
  factory :common_language, class: 'Common::Language' do
    name { 'MyString' }
    native_name { 'MyString' }
    code_iso_639_1 { 'MyString' }
    code_iso_639_2 { 'MyString' }
  end
end
