class Construction1Controller < ApplicationController
  def index
    add_breadcrumb "Construction Part 1", :construction1_index_path,:title => "Back to Construction Part 1 Page"
    @bc="Construction Part 1"
    @previous=root_path
    @next=construction2_index_path
  end
end
