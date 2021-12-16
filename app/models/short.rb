class Short < ApplicationRecord
    validates_presence_of :url
    validates :url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :shorturl, message: "Shortcode sudah dipake"
    validates_length_of :url, within: 3..255, on: :create, message: "too long"
    validates_length_of :shorturl, within: 3..255, on: :create, message: "too long"
    
    # the API
    def shorten
        SecureRandom.hex(3)
      end
end
