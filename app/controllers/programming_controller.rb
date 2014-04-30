class ProgrammingController < ApplicationController
  def index
    add_breadcrumb "Programming and Algorithm", :programming_index_path,:title => "Back to Programming Page"
    @bc="Programming and Algorithm"
    @previous=construction2_index_path
    @next=implement_index_path
  end
end
