class RepliesController < ApplicationController
  add_breadcrumb "Comment and Feedback", :comment_index_path,:title => "Back to Comment and Feedback Page"
  def index
    add_breadcrumb "Replies", :replies_index_path,:title => "Back to Reply Page"
    @reply = UserReply.new
    @head_comment=UserComment.view.where("id=?",params[:key])
    @view_reply=UserReply.view(params[:key])
  end
  def create
    @head_comment=UserComment.view.where("id=?",params[:key])
    @view_reply=UserReply.view(params[:key])
    @reply = UserReply.new(params[:user_reply])
      respond_to do |format|
        if @reply.save
        format.html {
            flash[:notice] ="Reply was successfully added."
            redirect_to :controller=>"replies",:action => "index",:key=>params[:key]
          }
          format.json { render json: @reply, status: :created, location: @reply }
        else
          format.html { 
            render action: "index"
          }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
      end
  end
end
