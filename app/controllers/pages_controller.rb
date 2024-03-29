# -*- coding: utf-8 -*-
class PagesController < ApplicationController
  layout "application"

  skip_authorization_check

  def root
    @testimonials = [
      {
        :message => "Setminton.dk, blablabla, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nisl quam, gravida id semper cursus, lacinia fringilla lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur dignissim aliquet diam nec semper. Proin eget urna a lorem laoreet posuere nec et turpis. Nullam vel mi ligula, in lacinia velit. Pellentesque quis libero ac felis adipiscing scelerisque.",
        :person => "Mads Ohm Larsen",
        :from => "Kongens Lyngby"
      },
      {
        :message => "EasyCoaching.dk, Phasellus et mauris velit. Curabitur sodales velit a libero varius eu dignissim enim consectetur. Sed scelerisque ullamcorper sem fringilla rutrum. Etiam volutpat, leo vel porttitor luctus, sem orci mattis libero, quis posuere ligula odio sed magna. In hac habitasse platea dictumst.",
        :person => "Asger Munk Ballegaard",
        :from => "Aalborg"
      }
    ]
  end

  def demo_popup
    if params[:email].present?
      UserMailer.request_demo(params).deliver
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
