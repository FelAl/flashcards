require "open-uri"

doc  = Nokogiri::HTML(open("http://sanstv.ru/english_words"), nil, "UTF-8")
date = Date.today
i = 2
user = User.create(email: "mail@mail.ru", password: "secret",
                   password_confirmation: "secret")
25.times do
  original_text_parsed   = doc.css("#table.table tbody tr td")[i].text.strip
  translated_text_parsed = doc.css("#table.table tbody tr td")[i + 2].text
  i += 5
  card = Card.create(translated_text: translated_text_parsed,
                     original_text:   original_text_parsed,
                     image_card:      File.open("default_img.jpg"),
                     review_date:     date,
                     user_id:         user.id)
  puts card.original_text

  card.update_attributes(review_date: Date.today)
end

puts user.cards
