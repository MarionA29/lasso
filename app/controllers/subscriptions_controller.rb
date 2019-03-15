class SubscriptionsController < ApplicationController

  def show
  end

  def new
  end


  def create
    @subscription = Subscription.new(asso_id: Asso.where(owner_id: current_user.id).first.id, stripe_customer_id: params[:stripeToken])
    @total = 100

    if @subscription.save
      flash[:success] = "Ta souscription est confirmée !"
      redirect_to root_path
    else
      flash[:error] = "Ta souscription n'a pas pu être confirmée ! Retente ta chance, ou contacte nous !"
      render root_path
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @total.to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to root_path
  end
end
