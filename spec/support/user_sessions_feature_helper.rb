module UserSessionsFeatureHelper

  def sign_in(username, password)
    visit root_path
    click_on "Log ind"

    within('#new_user_session') do
      fill_in 'user_session_username', :with => username
      fill_in 'user_session_password', :with => password
      click_on 'Log ind'
    end
  end

  def sign_out
    visit sign_out_path
  end

end

RSpec.configure do |config|
  config.include UserSessionsFeatureHelper, :type => :feature
end
