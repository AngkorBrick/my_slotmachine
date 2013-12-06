class Construction1Controller < ApplicationController
  def index
    add_breadcrumb "Construction Part 1", :construction1_index_path,:title => "Back to Construction Part 1 Page"
  end
end
