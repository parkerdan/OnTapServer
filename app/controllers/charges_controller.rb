class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
      if params[:stripeTokenOneTime]
          @amount = params[:donation_amount].to_i

          @text = "Thanks, you've made a one time payment of "
          # Stripe::Charge.create(
          #   :amount => (@amount * 100),
          #   :currency => 'usd',
          #   :source => params[:stripeTokenOneTime],
          #   :description => 'Custom Donation'
          # )
      elsif params[:stripeTokenSubscription]
        puts "***************************   SUBSCRIPTION  *****************************************"
        puts params.inspect

        @amount = params[:subscribe][:monthly].to_i
        @text = "Thanks, you\'ve signed up for a monthly donation of "
      end

      # customer = Stripe::Customer.create(
      # :email => params[:stripeEmail],
      # :source  => params[:stripeToken]
      # )

      # customer = Stripe::Customer.create(
      # :email => params[:stripeEmail],
      # :source  => params[:stripeToken]
      # )
      #
      # charge = Stripe::Charge.create(
      # :customer    => customer.id,
      # :amount      => '500',
      # :description => 'Rails Stripe customer',
      # :currency    => 'usd'
      # )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path

  end

end
