# frozen_string_literal: true

require 'csv'

module Seeds
  class Currencies
    # Load the currencies from the TSV file 'currencies.tsv' in the db/seeds/data folder
    # The file should have the following columns:
    # Codigo	Moneda	Simbolo
    # AED	Dirham de los Emiratos Árabes Unidos	د.إ
    # AFN	Afgani afgano	؋
    # ALL	Lek albano	Lek
    #
    def self.seed
      puts 'Seeding Currencies...'
      currency_csv_file_path = Rails.root.join('db', 'seeds', 'data', 'currencies.tsv')
      CSV.foreach(currency_csv_file_path, headers: true, col_sep: "\t") do |row|
        Common::Currency.find_or_create_by!(
          code_alpha: row['Code'],
          name: row['Currency'],
          symbol: row['Symbol']
        )
      end
    end
  end
end
