module ApplicationHelper
  def easycoaching_mail
    "info@easycoaching.dk"
  end

  def add_fields_data(f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render association.to_s.singularize + "_fields", :f => builder
    end
    
    escape_javascript fields
  end
end
