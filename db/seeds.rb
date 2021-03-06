require "open-uri"

doc  = Nokogiri::HTML(open("http://sanstv.ru/english_words"), nil, "UTF-8")
date = Date.today
i = 2
25.times do
  original_text_parsed   = doc.css("#table.table tbody tr td")[i].text.strip
  translated_text_parsed = doc.css("#table.table tbody tr td")[i + 2].text
  i += 5
  user = User.create(email: "mail@mail.ru", password: "secret",
                     password_confirmation: "secret")
  card = Card.create(translated_text: translated_text_parsed,
                     original_text:   original_text_parsed,
                     review_date:     date,
                     user_id:         user.id)

  card.update_attributes(review_date: Date.today)
end
