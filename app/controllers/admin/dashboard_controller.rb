class Admin::DashboardController < Admin::ApplicationController
  def index
    @user = User.all
    @asso_validate = Asso.where(validated: nil)
    @asso = Asso.all
    @subscriptions = Subscription.all
  end
end
