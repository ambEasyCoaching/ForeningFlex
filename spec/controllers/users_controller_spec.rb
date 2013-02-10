require 'spec_helper'

describe UsersController do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :user
  end

  # This returns the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "#show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      login_user user

      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "#edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      login_user user

      get :edit, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "#update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        login_user user
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({ "email" => "MyString" })
        put :update, { id: user.to_param, user: { "email" => "MyString" } }, valid_session
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        login_user user
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        login_user user
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(response).to redirect_to(account_path)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        login_user user
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, { id: user.to_param, user: { "email" => "invalid value" } }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "renders the 'show' template" do
        user = User.create! valid_attributes
        login_user user
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, { id: user.to_param, user: { "email" => "invalid value" } }, valid_session
        expect(response).to render_template("show")
      end
    end
  end
end
