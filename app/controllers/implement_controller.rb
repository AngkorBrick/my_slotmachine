class ImplementController < ApplicationController
  def index
    add_breadcrumb "Implementation", :implement_index_path,:title => "Back to Implementation Page"
  end
end
