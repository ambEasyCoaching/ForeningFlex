class Address < ActiveRecord::Base
  attr_accessible :address, :city, :email, :mobile, :phone, :zip
  belongs_to :user

  validates :phone, :format => { :with => /\d{8}/, :message => "kan kun indeholde tal" }
end
  