# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  location        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :location, :name, :password, :password_confirmation , :phone
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates_presence_of :email, :location , :name , :password , :password_confirmation, :phone

  validates_length_of :password , :minimum => 6
  validates_length_of :name , :maximum => 20
 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX} ,
  					uniqueness: { :case_sensitive => false }
 

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end


end
