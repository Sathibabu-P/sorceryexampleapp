class User < ActiveRecord::Base
  authenticates_with_sorcery!
	
	
  validates :email, uniqueness: true,presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  
end
