class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :backings
end
