class CheckoutController < ApplicationController

  def create

    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      return
    end

# binding.pry

# setup a stripe payment for session
#fix product amount and add qty
  @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: product.title,
      description:  product.template,
      amount: (product.price * 100).floor,
      currency: 'cad',
      quantity: 1
      }],
      success_url: checkout_success_url + '?session_id ={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url

  )


    respond_to do |format|
      format.js # render create.js.erb
    end

  end

  def cancel

    render "cancel"

  end

  def success
    # quick and dirty
    # not a good method, use stripes webhooks for successful payment

    if params[:session_id].nil?
      redirect_to root_path
      return
    end

    @success = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe:payment_intent.retrieve(@session_payment_intent)

  end


end
