class Transaction < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :transaction_msg

end
