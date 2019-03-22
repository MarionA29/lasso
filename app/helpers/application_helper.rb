module ApplicationHelper
  def bootstrap_class_for_flash(type)
  case type
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
  end
end
def news
  return  New.all
end
def assos
  return Asso.all
end
end
