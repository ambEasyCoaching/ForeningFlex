# -*- coding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: 'info@foreningflex.dk'
  #layout "user_mailer"

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

  def resign(user, club)
    @user = user
    @club = club
    mail :to => club.contact_person.email, :subject => "Udmeldelses fra #{club.name}"
  end
end
