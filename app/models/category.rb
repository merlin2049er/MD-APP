class Category < ActiveRecord::Base
    
  has_many :products
    
  validates_presence_of :name

  before_create :set_defaults

  def set_defaults
    self.picurl ||= 'photo_not_available.png'
  end


end

