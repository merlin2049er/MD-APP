# frozen_string_literal: true

class Cart < ActiveRecord::Base
  belongs_to  :user
  has_many    :products
end
