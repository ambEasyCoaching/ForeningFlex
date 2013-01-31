# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  has_many :authentications
  has_many :addresses

  acts_as_authentic do |config|
    config.perishable_token_valid_for = 2.weeks

    # Dangerous, remember to maintain perishable self 
    config.disable_perishable_token_maintenance true
  end 
  
  # Adding new roles should ALWAYS happen at the end of this array
  ROLES = %w[admin super_board board committee trainer coach player]

  #################
  # Scopes 
  
  scope :with_role, lambda { |role| { :conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 " } }
  
  #################
  # Methods

  def self.find_by_login_or_email(login)
    User.find_by_login(login) || User.find_by_email(login)
  end

  def apply_omniauth(omniauth)
    # Update user info fetching from social network
    case omniauth['provider']
    when 'facebook'
      self.email = omniauth['user_info']['email']  
    when 'developer'
      self.email = omniauth['info']['email']
      self.name = omniauth['info']['name']
    end
  end

  #################
  # Roles

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end

  def method_missing(sym, *args)
    if sym.to_s =~ /\A(.*)\?\z/ && ROLES.include?($1)
      roles.include?($1)
    else
      super
    end
  end

end
