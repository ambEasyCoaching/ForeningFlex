class UserSessionsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
  end
  
  def create
    if @user_session.save
      flash[:notice] = I18n.t('login_success')
      respond_to do |format|
        format.html { redirect_back_or_default account_url }
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
    current_user_session.destroy
    flash[:notice] = I18n.t('logout_success')
    redirect_back_or_default root_url
  end

  def load_user_from_perishable_token
    @user = User.find_using_perishable_token(params[:id])

    if @user.present?
      @user_session = UserSession.create(@user)
      redirect_to account_path
    else
      flash[:notice] = I18n.t('invalid_login')
      redirect_to root_path
    end
  end

end