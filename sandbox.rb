require 'open-uri'
require 'nokogiri'

html = open("https://en.wikipedia.org/wiki/Douglas_Adams")
doc = Nokogiri::HTML(html)
description = doc.css("p").children.text
puts description