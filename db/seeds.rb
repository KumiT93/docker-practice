require 'faraday'
require 'net/http'
require 'uri'
require 'json'
require "active_record"
require "activerecord-import"

client = Faraday.new(:url => "https://api.gnavi.co.jp/RestSearchAPI/v3/")
res = client.get("?keyid=#{ENV["KEY_ID"]}&area=AREA110&hit_per_page=100")
body = JSON.parse(res.body)
rest = body['rest']

restaurants = rest.map do |rest|
  Restaurant.new(name: rest['name'], url: rest['url'])
end
p restaurants.count

Restaurant.import(restaurants)
p Restaurant.last


