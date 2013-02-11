class UsersController < ApplicationController

  before_filter :require_login

  load_and_authorize_resource

  def index
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    else 
      @user = current_user
    end
    @user.addresses.build if @user.addresses.blank?
  end

  def new
  end

  def edit
    render :action => "show"
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.welcome(@user).deliver
      redirect_back_or_default account_path, :notice => "Du er nu registreret"
    else
      render :action => 'new'
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to account_path, :notice => "Konto opdateret"
    else
      render :action => "show"
    end
  end

  def resign
    if params[:id].present?
      # Send en mail
      # Meld mig ud
      UserMailer.resign(current_user, current_user.clubs.first, params[:argument]).deliver
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end
end
