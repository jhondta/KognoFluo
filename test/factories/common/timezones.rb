# frozen_string_literal: true

FactoryBot.define do
  factory :common_timezone, class: 'Common::Timezone' do
    name { 'MyString' }
    gmt_offset { '1.0' }
  end
end
