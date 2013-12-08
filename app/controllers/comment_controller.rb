class CommentController < ApplicationController
  def index
      add_breadcrumb "Comment and Feedback", :comment_index_path,:title => "Back to Comment and Feedback Page"
  end
end
