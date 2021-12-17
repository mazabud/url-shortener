require 'uri'
class Short < ApplicationRecord
    validates_presence_of :url, message: "Url is not present", status: 400
    #validates :url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :shorturl, message: "The the desired shortcode is already in use. Shortcodes are case-sensitive.", status: 409
    # validates_length_of :url, within: 3..255, on: :create, message: "too long"
    validates_format_of :shorturl, with: /((\w+\s?-?\w+)(,|\z))/i, on: :create, message: "The shortcode fails to meet the following regexp: ^[0-9a-zA-Z_]{6}$.", status: 422 
    
   
    # the API
    def shorten
        SecureRandom.uuid[0..5]
      end
end
