require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      username: "Username",
      first_name: "First Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /Username/
    expect(rendered).to match /First Name/
  end
end
