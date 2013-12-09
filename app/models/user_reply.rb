class UserReply < ActiveRecord::Base
  belongs_to :user_comment
  attr_accessible :email, :name,:reply
end
