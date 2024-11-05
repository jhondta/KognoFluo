# frozen_string_literal: true

module Seeds
  require_relative 'utilities'

  class Countries
    # Load the countries from the JSON file 'countries.json' in the db/seeds/data folder
    # The country JSON is an array of objects with the following structure:
    # {
    #     "name": {
    #       "common": "Mexico",
    #       "official": "United Mexican States",
    #       "nativeName": {
    #         "spa": {
    #           "official": "Estados Unidos Mexicanos",
    #           "common": "México"
    #         }
    #       }
    #     },
    #     "tld": [
    #       ".mx"
    #     ],
    #     "cca2": "MX",
    #     "ccn3": "484",
    #     "cca3": "MEX",
    #     "cioc": "MEX",
    #     "independent": true,
    #     "status": "officially-assigned",
    #     "unMember": true,
    #     "currencies": {
    #       "MXN": {
    #         "name": "Mexican peso",
    #         "symbol": "$"
    #       }
    #     },
    #     "idd": {
    #       "root": "+5",
    #       "suffixes": [
    #         "2"
    #       ]
    #     },
    #     "capital": [
    #       "Mexico City"
    #     ],
    #     "altSpellings": [
    #       "MX",
    #       "Mexicanos",
    #       "United Mexican States",
    #       "Estados Unidos Mexicanos"
    #     ],
    #     "region": "Americas",
    #     "subregion": "North America",
    #     "languages": {
    #       "spa": "Spanish"
    #     },
    #     "translations": {
    #       "deu": {
    #         "official": "Vereinigte Mexikanische Staaten",
    #         "common": "Mexiko"
    #       },
    #       "est": {
    #         "official": "Mehhiko Ühendriigid",
    #         "common": "Mehhiko"
    #       },
    #       "fin": {
    #         "official": "Meksikon yhdysvallat",
    #         "common": "Meksiko"
    #       },
    #     },
    #     "latlng": [
    #       23.0,
    #       -102.0
    #     ],
    #     "landlocked": false,
    #     "borders": [
    #       "BLZ",
    #       "GTM",
    #       "USA"
    #     ],
    #     "area": 1964375.0,
    #     "demonyms": {
    #       "eng": {
    #         "f": "Mexican",
    #         "m": "Mexican"
    #       },
    #       "fra": {
    #         "f": "Mexicaine",
    #         "m": "Mexicain"
    #       }
    #     },
    #     "flag": "\uD83C\uDDF2\uD83C\uDDFD",
    #     "maps": {
    #       "googleMaps": "https://goo.gl/maps/s5g7imNPMDEePxzbA",
    #       "openStreetMaps": "https://www.openstreetmap.org/relation/114686"
    #     },
    #     "population": 128932753,
    #     "gini": {
    #       "2018": 45.4
    #     },
    #     "fifa": "MEX",
    #     "car": {
    #       "signs": [
    #         "MEX"
    #       ],
    #       "side": "right"
    #     },
    #     "timezones": [
    #       "UTC-08:00",
    #       "UTC-07:00",
    #       "UTC-06:00"
    #     ],
    #     "continents": [
    #       "North America"
    #     ],
    #     "flags": {
    #       "png": "https://flagcdn.com/w320/mx.png",
    #       "svg": "https://flagcdn.com/mx.svg",
    #       "alt": "The flag of Mexico is composed of three equal vertical bands of green, white and red, with the national coat of arms centered in the white band."
    #     },
    #     "coatOfArms": {
    #       "png": "https://mainfacts.com/media/images/coats_of_arms/mx.png",
    #       "svg": "https://mainfacts.com/media/images/coats_of_arms/mx.svg"
    #     },
    #     "startOfWeek": "monday",
    #     "capitalInfo": {
    #       "latlng": [
    #         19.43,
    #         -99.13
    #       ]
    #     },
    #     "postalCode": {
    #       "format": "#####",
    #       "regex": "^(\\d{5})$"
    #     }
    #   }
    #
    def self.seed
      puts "Seeding Countries..."
      countries_file_path = Rails.root.join('db', 'seeds', 'data', 'countries.json')
      countries_data = JSON.parse(File.read(countries_file_path))
      countries_data.each do |country_data|
        country = Common::Country.find_or_initialize_by(code_alpha2: country_data['cca2'])
        common_name = name_by_type(country_data['name'], 'common')
        official_name = name_by_type(country_data['name'], 'official')
        tld = tld(country_data['tld'])
        phone_code = phone_code(country_data['idd'])

        country.update!(
          common_name: common_name,
          official_name: official_name,
          code_alpha3: country_data['cca3'],
          phone_code: phone_code,
          tld: tld,
          flag_svg: Seeds::Utilities.download_image(country_data['flags'], 'svg'),
          flag_png: Seeds::Utilities.download_image(country_data['flags'], 'png'),
        )
      end
    end

    private

    # Get the country name in the common language
    #
    # @param country_data [Hash] The country data
    # @return [String] The country common name
    #
    def self.name_by_type(name_data, type)
      native_name_data = name_data.dig('nativeName')
      if native_name_data.present?
        native_name_data.values.first[type]
      else
        name_data[type]
      end
    end

    # Get the TLD
    # The TLD is the first element of the TLD array
    #
    # @param tld_data [Array] The TLD data
    # @return [String] The TLD
    #
    def self.tld(tld_data)
      tld_data&.first || ''
    end

    # Get the phone code
    # The phone code is the concatenation of the root and the first suffix
    #
    # @param phone_data [Hash] The phone data
    # @return [String] The phone code
    #
    def self.phone_code(phone_data)
      root = phone_data.dig('root') || ''
      first_suffix = phone_data.dig('suffixes')&.first || ''
      "#{root}#{first_suffix}"
    end
  end
end
