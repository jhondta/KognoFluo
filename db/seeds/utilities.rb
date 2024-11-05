# frozen_string_literal: true

module Seeds
  require 'net/http'
  class Utilities
    # Loads the image text from the URL
    #
    # @param url [Hash] A Hash with the URL and the type of image to download
    # @return [String] the image text
    #
    def self.download_image(url, type = 'svg')
      uri = URI(url[type])
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        return Base64.encode64(response.body) if type == 'png'
        response.body
      else
        puts "Failed to download image for #{url}"
        nil
      end
    rescue StandardError => e
      puts "Error downloading image for #{url}: #{e.message}"
      nil
    end
  end
end
