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
end
