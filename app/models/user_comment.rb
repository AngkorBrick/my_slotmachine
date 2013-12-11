class UserComment < ActiveRecord::Base
  has_many :user_replies,:dependent => :destroy
  attr_accessible :comment, :email, :name
  validates :name,:email,:comment,:presence => true
end
