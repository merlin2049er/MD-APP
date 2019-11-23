class ChargeController < ApplicationController

  before_action :authenticate_user!

#
  def index
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = 'sk_test_GTNsI2Uc5BBqqWiHas7hYJlt00ruRDdxlo'

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]
    charge = Stripe::Charge.create({
        amount: 999,
        currency: 'usd',
        description: 'Example charge',
        source: token,
     })

  end


  def add_card
      if current_user.stripe_id.blank?
        customer = Stripe::Customer.create(
          email: current_user.email
        )
        current_user.stripe_id = customer.id
        current_user.save

        customer.sources.create(source: params[:stripeToken])
      else
        customer = Stripe::Customer.retrieve(current_user.stripe_id)
        customer.source = params[:stripeToken]
        customer.save
      end

      flash[:notice] = "Your card is saved!"
      redirect_to payment_method_path
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to payment_method_path
    end

   def charge(service, order)
      if !order.user.stripe_id.blank?
        customer = Stripe::Customer.retrieve(order.user.stripe_id)
        charge   = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => (order.total * 100).to_i,
          :description => service.name + ": " + service.description,
          :currency    => "usd",
          :transfer_data => {
            amount: (order.total * 80).to_i,
            destination: service.store.user.merchant_id,
          }
        )

        if charge
          flash[:notice] = "Order made and paid"
        else
          flash[:alert] = "Payment error on the order 😞"
        end
      end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
    end

end
