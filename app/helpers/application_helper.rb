module ApplicationHelper

  def flash_class (type)
    case type
      when 'error'
          "alert-danger"
      when 'notice'
          "alert-info"
      when 'alert'
          "alert-warning"
      when 'success'
          "alert-success"
    else
      type.to_s
    end
  end

  def move_flash_messages?
    params[:controller] == "places" && params[:action] == "index"
  end

end
