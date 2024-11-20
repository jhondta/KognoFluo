# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_06_023613) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "common_countries", force: :cascade do |t|
    t.string "common_name", limit: 100, null: false
    t.string "official_name", limit: 100, null: false
    t.string "code_alpha2", limit: 2, null: false
    t.string "code_alpha3", limit: 3, null: false
    t.string "phone_code", limit: 10, null: false
    t.string "tld", limit: 5, null: false
    t.text "flag_svg", null: false
    t.binary "flag_png", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_alpha2"], name: "index_common_countries_on_code_alpha2", unique: true
    t.index ["code_alpha3"], name: "index_common_countries_on_code_alpha3", unique: true
    t.index ["common_name"], name: "index_common_countries_on_common_name", unique: true
    t.index ["official_name"], name: "index_common_countries_on_official_name", unique: true
  end

  create_table "common_currencies", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "code_alpha", limit: 3, null: false
    t.string "code_numeric", limit: 3
    t.string "symbol", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_alpha"], name: "index_common_currencies_on_code_alpha", unique: true
    t.index ["name"], name: "index_common_currencies_on_name", unique: true
  end

  create_table "common_languages", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "native_name", limit: 255
    t.string "code_iso_639_1", limit: 2, null: false
    t.string "code_iso_639_2", limit: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code_iso_639_1"], name: "index_common_languages_on_code_iso_639_1", unique: true
    t.index ["code_iso_639_2"], name: "index_common_languages_on_code_iso_639_2", unique: true
    t.index ["name"], name: "index_common_languages_on_name", unique: true
  end

  create_table "common_measure_unit_types", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_common_measure_unit_types_on_name", unique: true
  end

  create_table "common_measure_units", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "abbreviation", limit: 10, null: false
    t.integer "common_measure_unit_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["common_measure_unit_type_id"], name: "index_common_measure_units_on_common_measure_unit_type_id"
    t.index ["name"], name: "index_common_measure_units_on_name", unique: true
  end

  create_table "common_timezones", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.decimal "gmt_offset", precision: 3, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_common_timezones_on_name", unique: true
  end

  create_table "maintenance_asset_assignees", force: :cascade do |t|
    t.integer "maintenance_asset_id", null: false
    t.integer "maintenance_technician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintenance_asset_id", "maintenance_technician_id"], name: "idx_on_maintenance_asset_id_maintenance_technician__bb4d0a6d96", unique: true
    t.index ["maintenance_asset_id"], name: "index_maintenance_asset_assignees_on_maintenance_asset_id"
    t.index ["maintenance_technician_id"], name: "index_maintenance_asset_assignees_on_maintenance_technician_id"
  end

  create_table "maintenance_asset_components", force: :cascade do |t|
    t.integer "maintenance_asset_id", null: false
    t.string "name", limit: 100, null: false
    t.text "description"
    t.integer "quantity"
    t.json "specifications"
    t.integer "replacement_period"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintenance_asset_id", "name"], name: "idx_on_maintenance_asset_id_name_a5e3516cdc", unique: true
    t.index ["maintenance_asset_id"], name: "index_maintenance_asset_components_on_maintenance_asset_id"
  end

  create_table "maintenance_asset_documents", force: :cascade do |t|
    t.integer "maintenance_asset_id", null: false
    t.string "document_type", limit: 100, null: false
    t.string "name", limit: 100, null: false
    t.text "description"
    t.string "version"
    t.date "expiration_date"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintenance_asset_id", "document_type", "name"], name: "idx_on_maintenance_asset_id_document_type_name_3f73026ac3", unique: true
    t.index ["maintenance_asset_id"], name: "index_maintenance_asset_documents_on_maintenance_asset_id"
  end

  create_table "maintenance_asset_types", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.text "description"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_maintenance_asset_types_on_code", unique: true
  end

  create_table "maintenance_assets", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.integer "maintenance_asset_type_id", null: false
    t.integer "organization_production_line_id", null: false
    t.integer "maintenance_manufacturer_id", null: false
    t.string "model"
    t.string "serial_number"
    t.date "manufacturing_date"
    t.date "purchase_date"
    t.date "warranty_expiration"
    t.integer "status", default: 1, null: false
    t.integer "criticality_level", default: 0, null: false
    t.json "technical_specs", default: {}, null: false
    t.string "physical_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_maintenance_assets_on_code", unique: true
    t.index ["maintenance_asset_type_id"], name: "index_maintenance_assets_on_maintenance_asset_type_id"
    t.index ["maintenance_manufacturer_id"], name: "index_maintenance_assets_on_maintenance_manufacturer_id"
    t.index ["organization_production_line_id"], name: "index_maintenance_assets_on_organization_production_line_id"
  end

  create_table "maintenance_manufacturers", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.integer "status", default: 1, null: false
    t.string "website"
    t.string "support_phone"
    t.string "suport_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_maintenance_manufacturers_on_code", unique: true
  end

  create_table "maintenance_plans", force: :cascade do |t|
    t.integer "maintenance_plan_template_id", null: false
    t.integer "maintenance_asset_id"
    t.integer "maintenance_asset_component_id"
    t.integer "status", default: 0, null: false
    t.date "start_date", null: false
    t.date "last_execution_date"
    t.date "next_execution_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintenance_asset_component_id"], name: "index_maintenance_plans_on_maintenance_asset_component_id"
    t.index ["maintenance_asset_id"], name: "index_maintenance_plans_on_maintenance_asset_id"
    t.index ["maintenance_plan_template_id"], name: "index_maintenance_plans_on_maintenance_plan_template_id"
  end

  create_table "maintenance_technicians", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "specialty", limit: 100
    t.string "certification_level"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_maintenance_technicians_on_user_id", unique: true
  end

  create_table "organization_areas", force: :cascade do |t|
    t.integer "organization_plant_id", null: false
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.text "description"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_plant_id", "code"], name: "index_organization_areas_on_organization_plant_id_and_code", unique: true
    t.index ["organization_plant_id"], name: "index_organization_areas_on_organization_plant_id"
  end

  create_table "organization_plants", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.text "address", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_organization_plants_on_code", unique: true
  end

  create_table "organization_production_lines", force: :cascade do |t|
    t.integer "organization_area_id", null: false
    t.string "code", limit: 10, null: false
    t.string "name", limit: 100, null: false
    t.text "description"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_area_id", "code"], name: "idx_on_organization_area_id_code_571ec478b4", unique: true
    t.index ["organization_area_id"], name: "index_organization_production_lines_on_organization_area_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.date "birth_date", null: false
    t.integer "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birth_date"], name: "index_user_profiles_on_birth_date"
    t.index ["first_name"], name: "index_user_profiles_on_first_name"
    t.index ["gender"], name: "index_user_profiles_on_gender"
    t.index ["last_name"], name: "index_user_profiles_on_last_name"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "common_measure_units", "common_measure_unit_types"
  add_foreign_key "maintenance_asset_assignees", "maintenance_assets"
  add_foreign_key "maintenance_asset_assignees", "maintenance_technicians"
  add_foreign_key "maintenance_asset_components", "maintenance_assets"
  add_foreign_key "maintenance_asset_documents", "maintenance_assets"
  add_foreign_key "maintenance_assets", "maintenance_asset_types"
  add_foreign_key "maintenance_assets", "maintenance_manufacturers"
  add_foreign_key "maintenance_assets", "organization_production_lines"
  add_foreign_key "maintenance_plans", "maintenance_asset_components"
  add_foreign_key "maintenance_plans", "maintenance_assets"
  add_foreign_key "maintenance_plans", "maintenance_plan_templates"
  add_foreign_key "maintenance_technicians", "users"
  add_foreign_key "organization_areas", "organization_plants"
  add_foreign_key "organization_production_lines", "organization_areas"
  add_foreign_key "user_profiles", "users"
end
