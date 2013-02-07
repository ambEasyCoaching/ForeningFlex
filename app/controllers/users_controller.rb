class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :resign]
  
  def create
    @user.reset_perishable_token
    if @user.save
      flash[:notice] = "Du er nu registreret"
      Notifier.welcome(@user).deliver
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
    @user.addresses.build if @user.addresses.blank?
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Konto opdateret"
      redirect_to account_url
    else
      render :action => :show
    end
  end

  def resign
    if params[:id].present?
      # Send en mail
      # Meld mig ud
      raise "TODO: Send en mail til klubbens kontaktperson."
    end
  end
end
