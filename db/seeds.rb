# encoding: utf-8
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doc  = Nokogiri::HTML(open("http://sanstv.ru/english_words"), nil, "UTF-8")
date = Date.today
i = 2
25.times do 
  original_text_parsed   = doc.css("#table.table tbody tr td")[i].text.strip
  translated_text_parsed = doc.css("#table.table tbody tr td")[i + 2].text
  i += 5
  Card.create(translated_text: translated_text_parsed, 
              original_text:   original_text_parsed, 
              review_date:     date)
end