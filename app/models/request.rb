# frozen_string_literal: true

class Request < ActiveRecord::Base
  acts_as_votable
  validates_presence_of :product
  validates_presence_of :manufacturer
end
