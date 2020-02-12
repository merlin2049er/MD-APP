
require 'stripe'

Rails.configuration.stripe = {
    :publishable_key => "pk_test_wNeuri3HuwlL2HgmMLaCfLxb00noMQ7VJG",
    :secret_key      => "sk_test_GTNsI2Uc5BBqqWiHas7hYJlt00ruRDdxlo"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
