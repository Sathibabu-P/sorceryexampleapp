class User < ActiveRecord::Base
#attr_accessor :email, :password, :password_confirmation, :authentications_attributes
  attr_accessor  :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  authenticates_with_sorcery!
	
	
  validates :email, uniqueness: true,presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  
end
