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
  def subscription
    return Subscription.all
  end
  def privates_messages
    return PrivateMessage.all
  end
  def user_match
    @asso = User.find(owner_id = current_user.id)
    @user = @asso.id
    if current_user.id != @user
      redirect_to root_path
    end
  end
  def asso_match
    @asso = Asso.find(params[:id])
    if @asso.owner_id != current_user.id
      flash[:error] = "Tu n'es pas le droit de faire cette modification !"
      return false
    else
      return true
    end
  end
  def new_match
    @new = New.find(params[:id])
    if Asso.find(@new.asso_id).owner_id != current_user.id
      flash[:error] = "Tu n'es pas le droit de faire cette modification !"
      return false
    else
      return true
    end
  end
end
