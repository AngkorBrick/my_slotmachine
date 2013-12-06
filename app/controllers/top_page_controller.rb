class TopPageController < ApplicationController
  def index
    add_breadcrumb "Basic Information", :top_page_index_path,:title => "Back to Basic Info Page"
  end
end
