# -*- coding: utf-8 -*-
class Address < ActiveRecord::Base
  attr_accessible :address, :city, :email, :mobile, :phone, :zip
  belongs_to :user

  validates_format_of :phone, :mobile, :with => /^\d{8}$/, :message => "kan kun indeholde tal og der skal være 8 af dem"
  validates_format_of :zip, :with => /^\d{4}$/, :message => "kan kun indeholde tal og der skal være 4 af dem"
  validates_format_of :city, :with => /\A[-A-Za-zæøåÆØÅ\. ]+\z/, :message => "er ugyldigt (må ikke indeholde tal eller specieltegn)"
  validates_length_of :address, :minimum => 5
  validates_presence_of :email
end
  
