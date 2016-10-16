class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def edit
    user = User.find_by_id(current_user.id)
    @plan_id = user.plan_id
  end

  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Amount in cents
      if params[:stripeTokenOneTime]
          @amount = params[:donation_amount].to_i

          @text = "We here at Brew Cards thank you!! You've made a one time payment of "
          Stripe::Charge.create(
            :amount => (@amount * 100),
            :currency => 'usd',
            :source => params[:stripeTokenOneTime],
            :description => 'Custom Donation'
          )
      elsif params[:stripeTokenSubscription]
        @amount = params[:subscribe][:monthly].to_i
        @text = "We here at Brew Cards thank you!!  You\'ve signed up for a monthly donation of "
        customer = Stripe::Customer.create(
            :source => params[:stripeTokenSubscription],
            :plan => params[:subscribe][:monthly],
            :email => params[:email]
          )
        @user = User.find_by_id(current_user.id)
        @user.stripe_id = customer.id
        @user.subscription_id = customer.subscriptions.data[0].id
        @user.plan_id = customer.subscriptions.data[0].plan.id
        @user.save
      end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

  def update
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    new_plan = params[:plan]
    user = User.find_by_id(current_user.id)
    subscription_id = user.subscription_id

    customer = Stripe::Customer.retrieve(user.stripe_id)
    subscription = customer.subscriptions.retrieve(subscription_id)

    if new_plan == 'Cancel'
      subscription.delete
      user.plan_id = ''
      user.stripe_id = ''
      user.subscription_id = ''
      user.save
      @text = "Brew Cards has cancelled your monthly donation :(  Monthly charge will be "
      @amount = 0
      render :create
    else
      subscription.plan = new_plan
      subscription.save
      user.plan_id = new_plan
      user.save
      @text = "Brew Cards has updated your monthly donation to "
      @amount = new_plan.to_i
      render :create
    end

  rescue Stripe::StripeError => e
    flash[:error] = e.message
    redirect_to :back

  end

end
