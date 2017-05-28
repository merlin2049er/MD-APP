class Request < ActiveRecord::Base

  belongs_to :user
  acts_as_votable


  after_initialize :set_defaults

  validates_presence_of :product
  validates_presence_of :manufacturer


  def set_defaults
    self.enabled  ||= false
  end

end
