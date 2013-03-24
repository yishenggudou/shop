class Food < ActiveRecord::Base
  attr_accessible :flesh, :image, :name
  belongs_to :user
end
