class UserReply < ActiveRecord::Base
  belongs_to :user_comment
  attr_accessible :email, :name,:reply,:created_at,:user_comment_id
  validates :name,:email,:reply,:presence => true
  scope :view, lambda{ |key| select("id,name,email,reply,created_at").where("user_comment_id=?",key).order("created_at ASC")}

end
