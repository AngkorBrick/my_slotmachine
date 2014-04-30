class ImplementController < ApplicationController
  def index
    add_breadcrumb "Implementation", :implement_index_path,:title => "Back to Implementation Page"
    @bc="Implementation"
    @previous=programming_index_path
    @next=about_team_index_path
  end
end
