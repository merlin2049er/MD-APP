# frozen_string_literal: true

class Photo < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :uri
  validates_presence_of :product_id
end
