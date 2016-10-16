class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def edit
    # subscription_id = User.find_by_id(current_user.id).subscription_id
    # if subscription_id != ''
    #   Stripe.api_key = Rails.configuration.stripe[:secret_key]
    #   customer = Stripe::Customer.retrieve(stripe_id)
    #   @subscription = customer.subscriptions.retrieve(subscription_id)
    # end
  end

  def create
    # Amount in cents
      if params[:stripeTokenOneTime]
          @amount = params[:donation_amount].to_i

          @text = "Thanks, you've made a one time payment of "
          Stripe::Charge.create(
            :amount => (@amount * 100),
            :currency => 'usd',
            :source => params[:stripeTokenOneTime],
            :description => 'Custom Donation'
          )
      elsif params[:stripeTokenSubscription]
        @amount = params[:subscribe][:monthly].to_i
        @text = "Thanks, you\'ve signed up for a monthly donation of "
        customer = Stripe::Customer.create(
            :source => params[:stripeTokenSubscription],
            :plan => params[:subscribe][:monthly],
            :email => params[:email]
          )
        @user = User.find_by_id(current_user.id)
        @user.stripe_id = customer.id
        @user.subscription_id = customer.subscriptions[0].id
        @user.save
      end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

end
