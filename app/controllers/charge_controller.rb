class ChargeController < ApplicationController

  before_action :authenticate_user!

  def index
    add_breadcrumb 'MASSDUMP', :root_path
    add_breadcrumb 'THANK YOU'
  end

  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]

    charge = Stripe::Charge.create({
        amount: 999,
        currency: 'can',
        description: 'Example charge',
        source: token,
    })
  end

end
