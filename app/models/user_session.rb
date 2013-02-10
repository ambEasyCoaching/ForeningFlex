class UserSession
  include ActiveAttr::BasicModel
  include ActiveAttr::MassAssignment

  attr_accessor :email, :username, :password, :remember_me
end
