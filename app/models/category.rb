class Category < ActiveRecord::Base
    has_many :products
    validates_presence_of :name

    def set_defaults
      self.picurl ||= 'photo_not_available.png'
    end
end
