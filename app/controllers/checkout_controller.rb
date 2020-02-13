class CheckoutController < ApplicationController

  def create

    product = Product.find(params[:id])
    #cart = Cart.find(params[:id])

    #if cart.nil?
    if product.nil?
      redirect_to root_path
      return
    end

# binding.pry

# setup a stripe payment for session
#fix product amount and add qty
  @session = Stripe::Checkout::Session.create(
    billing_address_collection: 'required',
    payment_method_types: ['card'],
    line_items: [{
      name: product.title,
#      description:  product.template,
      images: ['https://cryptic-inlet-13518.herokuapp.com/' + product.picurl],
      amount: (product.price * 100).floor,
      currency: 'cad',
      quantity: 1
      }],
# avoid using sessions like this... use webhooks instead
#     success_url: checkout_success_url + '?session_id ={CHECKOUT_SESSION_ID}',
      success_url: checkout_success_url
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
    

   # not sure if it returns a session id
   # if params[:session_id].nil?
   #   redirect_to root_path
   #   return
   # end

    @success = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe:payment_intent.retrieve(@session_payment_intent)

  end


end
