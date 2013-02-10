# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :addresses, :dependent => :destroy
  has_and_belongs_to_many :clubs
  
  #################
  # Validators
  
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_format_of :first_name, :last_name, :with => /\A[-A-Za-zæøåÆØÅüÜäÄëËïÏöÖÿáÁéÉúÚýÝíÍóÓâÂêÊûÛîÎôÔàÀèÈùÙìÌòÒ\. ]+\z/, :message => "er ugyldigt (må ikke indeholde tal eller specieltegn)"
  validates_presence_of :gender, :message => "er ikke bestemt"
  validates :email, :uniqueness => true, :presence => true, :email => true

  #validates_length_of :login, :minimum => 4
  #validates_inclusion_of :birth_day, :in => 2..99, message => "ugyldig"

  accepts_nested_attributes_for :addresses, :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :profile_picture, 
                    :path => "/profile-pictures/:id/:basename_:style.:extension",
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

  # Adding new roles should ALWAYS happen at the end of this array
  ROLES = %w[admin super_board board committee coach leader player]

  #################
  # Scopes 
  
  scope :with_role, lambda { |role| { :conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 " } }
  
  #################
  # Methods

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
