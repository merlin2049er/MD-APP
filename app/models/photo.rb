# frozen_string_literal: true

class Photo < ActiveRecord::Base
  belongs_to :product

  after_initialize :set_defaults

  validates_presence_of :uri
  # validates_presence_of :product_id
  #

  def set_defaults
    self.enabled ||= true
  end

end
