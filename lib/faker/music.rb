require 'json'
require 'open-uri'
require 'active_support/inflector'
require 'nokogiri'

#
# album/band name generation, cribbed from
# https://raw.githubusercontent.com/KevinBongart/ourbandiscalled/master/app/models/record.rb
#
module Faker
  class Music < Base
    class << self
      def band_name
        url = "http://en.wikipedia.org/w/api.php?action=query&list=random&rnlimit=1&rnnamespace=0&format=json"
        json = JSON.parse open(url).read
        title = json["query"]["random"].first["title"]

        band_name = title.gsub(/ \(.*\)$/, '')
        band_name = band_name.titleize
      end

      def album_name
        url = "http://www.quotationspage.com/random.php3"
        body = Nokogiri::HTML(open(url))
        last_quote = body.search("dt[@class*=quote]").last.search("a").first

        quote = last_quote.inner_html
        last_words = quote.split(/ /)
        last_words = last_words.last(4)
        last_words.last.gsub!(/\./, '')
        album_name = last_words.join(" ")
        album_name = album_name.titleize
      end
    end
  end
end
