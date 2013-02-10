class UserSessionsController < ApplicationController

  skip_before_filter :require_login, :except => [:destroy]
  skip_authorization_check

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    # TODO: Account not activated
    
    if @user = login(@user_session.username, @user_session.password, @user_session.remember_me)
      respond_to do |format|
        format.html { redirect_back_or_to account_path, :notice => I18n.t('login_success') }
        format.js { render js: "window.location.pathname = #{account_path.to_json}" }
      end 
    else
      respond_to do |format|
        format.html { 
          flash[:error] = I18n.t('login_failed')
          render :action => :new 
        }
        format.js { 
          @notice = I18n.t('login_failed')
          render :partial => "flash" 
        }
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => I18n.t('logout_success')
  end

end
