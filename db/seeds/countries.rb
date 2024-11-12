# frozen_string_literal: true

module Seeds
  class Countries
    # Load the countries from the CSV file 'common_countries.csv' in the db/seeds/data folder
    # The country CSV file has the following columns:
    # - common_name
    # - official_name
    # - code_alpha2
    # - code_alpha3
    # - phone_code
    # - tld
    # - flag_svg
    # - flag_png
    #
    def self.seed
      puts "Seeding Countries..."
      countries_file_path = Rails.root.join('db', 'seeds', 'data', 'countries.csv')
      countries_data = CSV.read(countries_file_path, headers: true)
      countries_data.each do |country_data|
        country = Common::Country.find_or_initialize_by(code_alpha2: country_data['code_alpha2'])
        country.update!(
          common_name: country_data['common_name'],
          official_name: country_data['official_name'],
          code_alpha3: country_data['code_alpha3'],
          phone_code: country_data['phone_code'],
          tld: country_data['tld'],
          flag_svg: country_data['flag_svg'],
          flag_png: country_data['flag_png'],
        )
      end
    end
  end
end
