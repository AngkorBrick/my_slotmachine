class CommentReplyMailer < ActionMailer::Base
  default from: "from@example.com"
  #ActionMailer::Base.asset_host = 'http://localhost:3000'
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
  
  def notify_commenter(comment_id,reply_id)
      @comment=UserComment.find(comment_id)
      @reply=UserReply.find(reply_id)
      @reply_list=UserReply.view(comment_id)
      if Rails.env.development?
        @url="http://localhost:3000/reply/index?key_com=#{comment_id}"
      else
        @url="reply/index?key_com=#{comment_id}"
      end
      mail(to: @comment.email, subject: "You've got a reply at SK Slot Machine Project")
  end
  
  #function already done....to do is varify and testing
  #also to do next is change comment or reply head to bold
  def notify_replyer(comment_id,reply_id, sent_mail,sent_name)
      @comment=UserComment.find(comment_id)
      @reply=UserReply.find(reply_id)
      @reply_list=UserReply.view(comment_id)
      @get_reply=sent_name
      if Rails.env.development?
        @url="http://localhost:3000/reply/index?key_com=#{comment_id}"
      else
        @url="reply/index?key_com=#{comment_id}"
      end
      mail(to: sent_mail, subject: "#{@reply.name} replied on a comment at SK Slot Machine Project")
  end
  
  def self.multi_receivers(comment_id,reply_id)
    @reply=UserReply.find(reply_id)
    @to_send=UserReply.select_filter(comment_id) 
    @to_send.each_with_index do |i|
      unless i.email==@reply.email || i.email=="roun.sk@gmail.com"
        notify_replyer(i.email,i.name,@reply.name,comment_id,reply_id).deliver
      end
    end
  end
  
  def notify_replyer(email,name,who,page,r_id)
    if Rails.env.development?
        @url="http://localhost:3000/reply/index?key_com=#{page}"
    else
        @url="reply/index?key_com=#{page}"
    end
    @get_reply=name
    @comment=UserComment.find(page)
    @reply=UserReply.find(r_id)
    @reply_list=UserReply.view(page)
    mail(to: email, subject: "#{who} replied on a comment at SK Slot Machine Project")
  end
end
