class TopPageController < ApplicationController
  def index
    add_breadcrumb "Basic Information", :top_page_index_path,:title => "Back to Basic Info Page"
    @bc="Basic Information"
    @previous=comment_index_path
    @next=construction1_index_path
  end
end
