class User < ActiveRecord::Base
  attr_accessible :email, :location, :name, :password_digest, :phone
  has_secure_password
  
  before_save { |user| user.email = email.downcase }

  validates_presence_of :email, :location , :name , :password , :password_confirmation, :phone

  validates_length_of :password , :minimum => 6
 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :uniqueness => { :case_sensitive => false },
 	             format: {with: VALID_EMAIL_REGEX}
end
