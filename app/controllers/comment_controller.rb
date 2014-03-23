class CommentController < ApplicationController
  def index
      add_breadcrumb "Comment and Feedback", :comment_index_path,:title => "Back to Comment and Feedback Page"
      @comment = UserComment.new
      @view_comment=UserComment.view
  end 
 
  def create
    @comment = UserComment.new(params[:user_comment])
    @view_comment=UserComment.view
      respond_to do |format|
        if @comment.save
          #render :partial => 'comment', :object => @comment
          CommentReplyMailer.thank_comment(@comment.id).deliver
          format.html {
              flash[:notice] ="Comment was successfully added."
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
  def destroy
    @comment = UserComment.find(params[:key_com])
    @comment.destroy
  
    respond_to do |format|
      flash[:notice] ="Comment was successfully deleted."
      format.html { redirect_to :comment_index }
    end
    rescue Exception => e
        respond_to do |format|
          flash[:alert] = "Error class: #{e.class}<br/>Error message: #{e}".html_safe
          format.html {redirect_to comment_index_path, notice: 'Deletion is cancelled.' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
  end
end
