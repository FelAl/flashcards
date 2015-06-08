class Card < ActiveRecord::Base

  validates :original_text, presence: true

  before_create do
    set_default_date
  end

  def set_default_date
    self.review_date = Date.today
  end
end
