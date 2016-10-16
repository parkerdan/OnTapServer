class ChargesController < ApplicationController

  def new
  end

  def create(i)
    # Amount in cents
    if i == 1
      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => '500',
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )
    else
      customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => '500',
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
      )
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
