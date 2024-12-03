# frozen_string_literal: true

require 'csv'

module Seeds
  class Timezones
    # Load the Timezones from the TSV file 'timezones.tsv' in the db/seed_data folder
    # The file should have the following columns:
    # Country Code 	Country Name 	Time Zone 	GMT Offset
    # AF 	Afghanistan 	Asia/Kabul 	UTC +04:30
    # AL 	Albania 	Europe/Tirane 	UTC +02:00
    # DZ 	Algeria 	Africa/Algiers 	UTC +01:00
    #
    def self.seed
      puts 'Seeding Timezones...'
      timezone_csv_file_path = Rails.root.join('db', 'seeds', 'data', 'timezones.tsv')
      CSV.foreach(timezone_csv_file_path, headers: true, col_sep: "\t") do |row|
        timezone = Common::Timezone.find_or_initialize_by(name: row['Time'])
        # Convert GMT Offset to decimal(3, 1)
        gmt_offset = row['GMT Offset'].match(/([+-]\d{2}):(\d{2})/)
        timezone.update!(gmt_offset: gmt_offset[1].to_i + gmt_offset[2].to_i / 60.0)
      end
    end
  end
end
