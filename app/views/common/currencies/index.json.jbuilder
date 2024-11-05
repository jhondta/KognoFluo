# frozen_string_literal: true

json.array! @common_currencies, partial: 'common/currencies/common_currency', as: :common_currency
