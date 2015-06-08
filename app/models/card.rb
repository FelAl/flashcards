class Card < ActiveRecord::Base

  validates :original_text,   presence: true
  validates :translated_text, presence: true
  validate  :check_duplication


  before_create do
    set_default_date
  end

  def check_duplication
    if original_text == translated_text
      errors.add(:duplication, 'Значения полей дублируют друг друга.') 
    end
  end

  def set_default_date
    self.review_date = Date.today
  end
end
