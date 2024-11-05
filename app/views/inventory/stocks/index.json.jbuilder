# frozen_string_literal: true

json.array! @inventory_stocks, partial: 'inventory/stocks/inventory_stock', as: :inventory_stock
