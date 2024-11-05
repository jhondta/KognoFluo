# frozen_string_literal: true

FactoryBot.define do
  factory :common_timezone, class: 'Common::Timezone' do
    name { 'MyString' }
    gmt_offset { '99.9' }
  end
end
