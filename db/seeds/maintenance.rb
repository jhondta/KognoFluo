# frozen_string_literal: true

puts 'Starting maintenance seed...'
Faker::Config.locale = 'es-MX'

0.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: Time.now
  )
end

# Datos de prueba para la tabla plants
0.times do |i|
  Configuration::Plant.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
    active: true
  )
end

# Datos de prueba para la tabla areas
plants = Configuration::Plant.all
0.times do |i|
  Configuration::Area.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    configuration_plant_id: plants.sample.id,
    active: true
  )
end

# Datos de prueba para la tabla production_lines
areas = Configuration::Area.all
0.times do |i|
  Configuration::ProductionLine.create!(
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    name: "Línea de Producción #{i + 1}",
    description: Faker::Lorem.paragraph(sentence_count: 2),
    configuration_area_id: areas.sample.id,
    active: true
  )
end

# Datos de prueba para la tabla manufacturers
0.times do |i|
  Maintenance::Manufacturer.create!(
    name: Faker::Company.unique.name,
    code: Faker::Alphanumeric.alpha(number: 3).upcase,
    website: Faker::Internet.url,
    contact_info: { email: Faker::Internet.email,
                    phone: Faker::PhoneNumber.phone_number },
    support_phone: Faker::PhoneNumber.phone_number,
    suport_email: Faker::Internet.email,
    notes: Faker::Lorem.paragraph(sentence_count: 2),
    active: true
  )
end

# Datos de prueba para la tabla asset_types
0.times do
  Maintenance::AssetType.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 5).upcase,
    name: Faker::Appliance.equipment,
    description: Faker::Lorem.sentence,
    requires_calibration: [true, false].sample,
    maintenance_frequency: rand(1..12),
    active: [true, false].sample
  )
end

# Datos de prueba para la tabla assets
asset_types = Maintenance::AssetType.all
production_lines = Configuration::ProductionLine.includes(area: :plant)
manufacturers = Maintenance::Manufacturer.all
50.times do
  Maintenance::Asset.create!(
    code: Faker::Alphanumeric.unique.alpha(number: 3).upcase,
    name: Faker::Appliance.equipment,
    maintenance_asset_type_id: asset_types.sample.id,
    configuration_production_line_id: production_lines.sample.id,
    maintenance_manufacturer_id: manufacturers.sample.id,
    model: Faker::Alphanumeric.alpha(number: 8).upcase,
    serial_number: Faker::Alphanumeric.unique.alpha(number: 12).upcase,
    manufacturing_date: Faker::Date.between(from: '2015-01-01', to: '2020-12-31'),
    purchase_date: Faker::Date.between(from: '2021-01-01', to: '2023-12-31'),
    warranty_expiration: Faker::Date.between(from: '2024-01-01', to: '2026-12-31'),
    status: Maintenance::Asset::STATUSES.sample,
    criticality_level: Maintenance::Asset::CRITICALITY_LEVELS.sample,
    technical_specs: { power: "#{rand(100..500)}W", voltage: "#{rand(110..240)}V" },
    operation_conditions: { temp_range: "#{rand(-10..50)}C", humidity: "#{rand(20..80)}%" },
    physical_location: Faker::Address.secondary_address,
    notes: Faker::Lorem.sentence
  )
end

puts 'Maintenance seed completed.'
