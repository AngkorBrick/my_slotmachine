class AboutTeamController < ApplicationController  
  def index
    add_breadcrumb "About Team", :about_team_index_path,:title => "Back to About Team Page"
    @bc="About Team"
    @previous=implement_index_path
    @next=comment_index_path
  end
end
