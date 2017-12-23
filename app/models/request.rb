class Request < ActiveRecord::Base
  validates_presence_of :product
  validates_presence_of :manufacturer
end
