# frozen_string_literal: true

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :root do
  link t('home'), root_path
end

crumb :maintenance_assets do
  link t('maintenance.assets.index.breadcrumb'), maintenance_assets_path
  parent :root
end

crumb :maintenance_asset do |asset|
  link asset.full_code, maintenance_asset_path(asset)
  parent :maintenance_assets
end

crumb :new_maintenance_asset do
  link t('maintenance.assets.new.breadcrumb'), new_maintenance_asset_path
  parent :maintenance_assets
end

crumb :edit_maintenance_asset do |asset|
  link t('maintenance.assets.edit.breadcrumb'), edit_maintenance_asset_path(asset)
  parent :maintenance_asset, asset
end
