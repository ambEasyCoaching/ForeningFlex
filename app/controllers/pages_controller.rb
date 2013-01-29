# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  skip_authorization_check

  def demo_popup
    if params[:email].present?
      Notifier.request_demo(params).deliver
      @modal = {:header => "Mail afsendt", :body => "Din forespørgsel er blevet afsted. Du hører fra os snarest.", :button_text => "Tak"}
    else
      @modal = {:header => "Mail ikke afsendt", :body => "Din forespørgsel blev ikke afsted. Du mangler at indtaste din emailadresse.", :button_text => "Jeg prøver igen"}
    end
        
    respond_to do |format|
      format.js { render :partial => 'shared/simple_popup' }
      format.html { render :nothing }
    end
  end

end
