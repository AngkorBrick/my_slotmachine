class CommentReplyMailer < ActionMailer::Base
  default from: "from@example.com"
  def thank_comment(comment_id)
    @comment=UserComment.find(comment_id)
    if Rails.env.development?
      @url="http://localhost:3000/reply/index?key_com=#{comment_id}"
    else
      @url="reply/index?key_com=#{comment_id}"
    end
    mail(to: @comment.email, subject: 'Thanks for your comment!')
  end
  def notify_admin(comment_id)
    @comment=UserComment.find(comment_id)
    if Rails.env.development?
      @url="http://localhost:3000/reply/index?key_com=#{comment_id}"
    else
      @url="reply/index?key_com=#{comment_id}"
    end
    mail(to: "roun.sk@gmail.com", subject: "SK Slot Machine: Commented from #{@comment.email}")
  end
  
  def notify_admin_reply(comment_id,reply_id)
      @comment=UserComment.find(comment_id)
      @reply=UserReply.find(reply_id)
      @reply_list=UserReply.view(comment_id)
      if Rails.env.development?
        @url="http://localhost:3000/reply/index?key_com=#{comment_id}"
      else
        @url="reply/index?key_com=#{comment_id}"
      end
      mail(to: "roun.sk@gmail.com", subject: "SK Slot Machine: Replied from #{@reply.email}")
  end
  
  ###
  def notify_commenter
  end
  
  def notify_replyer
  end
  
end
