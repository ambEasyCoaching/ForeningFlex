class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization
  helper :all
  helper_method :current_user_session, :current_user

  rescue_from CanCan::AccessDenied do
    flash[:error] = I18n.t('access_denied')
    redirect_back_or_default(root_path)
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = I18n.t('logged_in')
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = I18n.t('logged_out')
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
