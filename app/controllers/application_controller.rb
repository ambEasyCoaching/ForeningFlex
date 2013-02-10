class ApplicationController < ActionController::Base
  
  protect_from_forgery
  check_authorization

  protected

  def not_authenticated
    redirect_to root_path, :alert => "Please sign in first."
  end

end
