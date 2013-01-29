# -*- coding: utf-8 -*-
class Role < ActiveRecord::Base
  def player?
    name.downcase == "spiller"
  end  

  def team_leader?
    name.downcase == "holdleder"
  end

  def trainer?
    name.downcase == "træner"
  end

  def committee_member?
    name.downcase == "udvalgsmedlem"
  end

  def board_member?
    name.downcase == "bestyrelsesmedlem"
  end

  def extended_board_member?
    name.downcase == "bestyrelsesmedlem med alle rettigheder"
  end

  def super_user?
    name.downcase == "super bruger"
  end
end
