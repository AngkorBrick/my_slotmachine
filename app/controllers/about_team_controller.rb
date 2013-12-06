class AboutTeamController < ApplicationController  
  def index
    add_breadcrumb "About Team", :about_team_index_path,:title => "Back to About Team Page"
  end
end
