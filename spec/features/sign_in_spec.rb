require 'spec_helper'

feature "Sign In" do
  background(:all) do
    @user = create(:user)
    @user.activate!
  end

  scenario "authenticates with valid credentials" do
    sign_in(@user.username, 'password')

    expect(find('.alert')).to have_content(I18n.t('login_success'))
  end

  scenario "displays a generic error message with an invalid username" do
    sign_in('this is not valid', 'password')

    expect(find('.alert')).to have_content("Forkert login")
  end

  scenario "displays a generic error message with an invalid password" do
    sign_in(@user.username, 'this is not valid')

    expect(find('.alert')).to have_content("Forkert login")
  end
end
