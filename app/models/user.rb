class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :cards, dependent: :destroy
  validates :email, :password, presence: true
end
