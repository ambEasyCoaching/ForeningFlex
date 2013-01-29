class AuthenticationsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if authentication
      # User is already registered with application
      flash[:info] = I18n.t('login_success')
      sign_in_and_redirect(authentication.user)
    elsif current_user
      # User is signed in but has not already authenticated with this social network
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      current_user.apply_omniauth(omniauth)
      current_user.save

      flash[:info] = I18n.t('login_success')
      redirect_to account_path
    else
      # User is new to this application
      user = User.new
      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      user.apply_omniauth(omniauth)

      if user.save
        flash[:info] = I18n.t('login_success')
        sign_in_and_redirect(user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_path
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    #flash[:notice] = 'Successfully destroyed authentication.'
    redirect_to authentications_url
  end

  private
  def sign_in_and_redirect(user)
    unless current_user
      user_session = UserSession.new(User.find_by_perishable_token(user.perishable_token))
      user_session.save
    end
    redirect_to account_path
  end
end