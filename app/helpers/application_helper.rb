module ApplicationHelper
  def easycoaching_mail
    "info@easycoaching.dk"
  end

  def js(*options)
    escape_javascript(*options)
  end
end
