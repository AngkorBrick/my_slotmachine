class Construction2Controller < ApplicationController
  def index
    add_breadcrumb "Construction Part 2", :construction2_index_path,:title => "Back to Construction Part 2 Page"
    @bc="Construction Part 2"
    @previous=construction1_index_path
    @next=programming_index_path
  end
end
