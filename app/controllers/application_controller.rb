class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile
  
  add_breadcrumb "Home", :root_path,:title => "Back to Top Page"
  def download_presentation
    send_file "#{Rails.root}/app/assets/file/KurounSeungPresentation.pdf"
  end
  def download_code
    send_file "#{Rails.root}/app/assets/file/SlotMachineB.rar"
  end
  def download_poster
    send_file "#{Rails.root}/app/assets/file/Poster.pdf"
  end

  private
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?
  def prepare_for_mobile
    request.format = :mobile if mobile_device?
  end
end
