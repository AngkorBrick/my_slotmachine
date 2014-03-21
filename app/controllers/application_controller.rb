class ApplicationController < ActionController::Base
  protect_from_forgery
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

end
