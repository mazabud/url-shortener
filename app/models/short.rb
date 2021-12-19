require 'uri'
class Short < ApplicationRecord
    validates_presence_of :url, message: "Url is not present", status: 400
    #validates :url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :shortcode, message: "The the desired shortcode is already in use. Shortcodes are case-sensitive.", status: 409
    # validates_length_of :url, within: 3..255, on: :create, message: "too long"
    validates_format_of :shortcode, with: /\b[A-Z0-9_]{6}\b/i, on: :create, message: "The shortcode fails to meet the following regexp: ^[0-9a-zA-Z_]{6}$.", status: 422 
    
    def shorten
      if self.shortcode.nil? || self.shortcode.empty?
        self.shortcode = SecureRandom.uuid[0..5]
      else
        self.shortcode = self.shortcode 
      end
    end
   
    # def shorten
    #     SecureRandom.uuid[0..5]
    # end
end
