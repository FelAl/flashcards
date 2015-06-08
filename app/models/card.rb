class Card < ActiveRecord::Base

  validates :original_text,   presence: true
  validates :translated_text, presence: true
  validates :review_date,     presence: true
  validate  :check_duplication

  before_create do
    set_default_date
  end

  def check_duplication
    if original_text.downcase == translated_text.downcase
      errors.add(:duplication, "Значения полей дублируют друг друга.") 
    end
  end

  def set_default_date
    self.review_date = Date.today + 3.days
  end
end
