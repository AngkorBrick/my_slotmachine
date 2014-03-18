class RepliesController < ApplicationController
  add_breadcrumb "Comment and Feedback", :comment_index_path,:title => "Back to Comment and Feedback Page"
  def index
    add_breadcrumb "Replies", :reply_index_path,:title => "Back to Reply Page"
    @reply = UserReply.new
    
    @head_comment=UserComment.view.where("id=?",params[:key_com])
    @view_reply=UserReply.view(params[:key_com])
    @comment = UserComment.find(params[:key_com])
  end
  def create
    @reply = UserReply.new(params[:user_reply])
      respond_to do |format|
        if @reply.save
        format.html {
            flash[:notice] ="Reply was successfully added."
            redirect_to :controller=>"replies",:action => "index",:key_com=>params[:key_com]
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
  def destroy
    @reply = UserReply.find(params[:key_re])
    @reply.destroy
  
    respond_to do |format|
      format.html {
        flash[:notice] ="Reply was successfully deleted."
        redirect_to :controller=>"replies",:action => "index",:key_com=>params[:key_com]
      }
    end
    rescue Exception => e
        respond_to do |format|
          flash[:alert] = "Error class: #{e.class}<br/>Error message: #{e}".html_safe
          format.html {redirect_to comment_index_path, notice: 'Deletion is cancelled.' }
          format.json { render json: @reply.errors, status: :unprocessable_entity }
        end
  end
end