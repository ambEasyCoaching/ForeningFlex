# -*- coding: utf-8 -*-
class Club < ActiveRecord::Base
  attr_accessible :city, :contact_person, :cvr, :initials, :logo, :merchant_number, :name, :sms_counter, :sport, :street_name, :street_number, :website, :zip
  has_and_belongs_to_many :members, :class_name => "User"
  belongs_to :contact_person, :class_name => "User"

  has_attached_file :club_logo, 
                    :path => "/club-logos/:id/:basename_:style.:extension",
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :s3_host_name => "s3-eu-west-1.amazonaws.com",
                    :s3_headers => { 
                      "Expires"       => 1.year.from_now.httpdate, 
                      "Cache-Control" => "public, max-age=31557600" 
                    },
                    :styles => { 
                      :medium => "300x300>", 
                      :thumb => "150x150>"
                    }
end