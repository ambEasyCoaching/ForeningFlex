# -*- coding: utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "info@setminton.dk"
  layout "notifier/setminton"

  def test_mail(user)
    @user = user
    mail :to => @user.email, :subject => "Test mail"
  end
  
  def request_demo(options = {})
    @options = options
    mail :to => "info@easycoaching.dk", :subject => "Ny forespørgsel på et demo login"
  end

  def welcome(user)
    @user = user
    mail :to => @user.email, :subject => ""
  end
end
