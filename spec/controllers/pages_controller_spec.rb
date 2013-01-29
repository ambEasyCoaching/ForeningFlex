require 'spec_helper'

describe PagesController do
  it "renders demo" do
    get :demo
  end

  context "demo" do
    it "doesnt send mail on invalid input" do
       
    end
  end
end
