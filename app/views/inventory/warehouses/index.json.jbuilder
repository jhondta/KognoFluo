# frozen_string_literal: true

json.array! @inventory_warehouses, partial: 'inventory/warehouses/inventory_warehouse', as: :inventory_warehouse
