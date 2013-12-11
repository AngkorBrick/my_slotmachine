class CommentController < ApplicationController
  def index
      add_breadcrumb "Comment and Feedback", :comment_index_path,:title => "Back to Comment and Feedback Page"
      @comment = UserComment.new
      @view_comment=UserComment.view
      #@view_reply=UserReply.view(params[:id])
  end  
  def create
  @comment = UserComment.new(params[:user_comment])
  @view_comment=UserComment.view
      respond_to do |format|
        if @comment.save
          format.html {
            flash[:notice] ="Comment was successfully added!"
            redirect_to :controller=>"comment",:action => "index"
          }
          format.json { render json: @comment, status: :created, location: @comment }
        else
          format.html {   
            render action: "index"
          }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
  end
end
