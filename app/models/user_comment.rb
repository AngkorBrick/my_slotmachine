class UserComment < ActiveRecord::Base
  has_many :user_replies,:dependent => :destroy
  attr_accessible :comment, :email, :name,:created_at
  validates :name,:email,:comment,:presence => true
  scope :view, select("name,email,comment,created_at").order("created_at DESC")
end
