class Card < ActiveRecord::Base
  after_initialize do
    self.review_date ||= Date.today
  end
end
