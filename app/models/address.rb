class Address < ActiveRecord::Base
  attr_accessible :address, :city, :email, :mobile, :phone, :zip
  belongs_to :user
end
