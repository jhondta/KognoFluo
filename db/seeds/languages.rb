# frozen_string_literal: true

module Seeds
  class Languages
    # Load the languages from the TSV file 'languages.tsv' in the db/seeds/data folder
    # The file should have the following columns:
    # Name	ISO 639-1	ISO 639-2
    # Abkhaz	ab	abk
    # Afar	aa	aar
    # Africanos	af	afr
    #
    def self.seed
      puts 'Seeding Languages...'
      languages_file_path = Rails.root.join('db', 'seeds', 'data', 'languages.tsv')
      CSV.foreach(languages_file_path, headers: true, col_sep: "\t") do |row|
        Language.find_or_create_by!(
          name: row['Name'],
          iso_code2: row['ISO 639-1'].upcase,
          iso_code3: row['ISO 639-2'].upcase
        )
      end
    end
  end
end
