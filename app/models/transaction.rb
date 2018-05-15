class Transaction < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :invoice_number
  validates_presence_of :tracking_number
  validates_presence_of :postal_carrier

    # validates_presence_of :transaction_msg


end
