class Club < ActiveRecord::Base
  attr_accessible :city, :contact_person, :cvr, :initials, :logo, :merchant_number, :name, :sms_counter, :sport, :street_name, :street_number, :website, :zip
  has_and_belongs_to_many :members, :class_name => "User"
  belongs_to :contact_person, :class_name => "User"
end
