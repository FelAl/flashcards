class Card < ActiveRecord::Base
  scope :unviewed, -> {find_by_sql "SELECT * FROM cards WHERE review_date <=\
    (CURRENT_DATE - integer '3') ORDER BY random()"} 

  validates :original_text, :translated_text, :review_date,   presence: true
  validate  :check_duplication

  before_create :set_default_date

  def check_duplication
    downcase_original_text   = original_text.mb_chars.downcase.to_s
    downcase_translated_text = translated_text.mb_chars.downcase.to_s
    if downcase_original_text == downcase_translated_text
      errors.add(:duplication, "Значения полей дублируют друг друга.") 
    end
  end

  def set_default_date
    self.review_date = Date.today + 3.days
  end

  def compare_translations(submitted_text)
    origianl = self.translated_text.mb_chars.downcase.to_s
    submitted = submitted_text.mb_chars.downcase.to_s
    if original == submitted
      self.update_attribute(:review_date, (Date.today + 3.days))
      return true
    else
      return false
    end
  end
end
