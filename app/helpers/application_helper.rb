module ApplicationHelper
  def has_sidebar?
    return true if request[:controller] == 'users' and request[:action] == 'index' and request[:tag].nil?
    return true if request[:controller] == 'projects'
    return true if request[:controller] == 'groups'
    return false
  end
end
