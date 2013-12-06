class ProgrammingController < ApplicationController
  def index
    add_breadcrumb "Programming and Algorithm", :programming_index_path,:title => "Back to Programming Page"
  end
end
