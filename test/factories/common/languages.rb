# frozen_string_literal: true

FactoryBot.define do
  factory :common_language, class: 'Common::Language' do
    name { 'English' }
    native_name { 'English' }
    code_iso_639_1 { 'EN' }
    code_iso_639_2 { 'ENG' }
  end
end
