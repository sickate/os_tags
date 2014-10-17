module ApplicationHelper
  def has_sidebar?
    return true if request[:controller] == 'users' and request[:action] == 'index' and request[:tag].nil?
    return true if request[:controller] == 'projects'
    return true if request[:controller] == 'groups'
    return false
  end

   def bootstrap_class_for flash_type
	case flash_type.to_sym
	  when :success
	    "alert-success"
	  when :error
	    "alert-danger"
	  when :alert
	    "alert-warning"
	  when :notice
	    "alert-info"
	  else
	    flash_type.to_s
	end
  end
end
