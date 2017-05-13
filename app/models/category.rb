class Category < ActiveRecord::Base
    
    has_many :products
    
   validates_presence_of :name

def edit
end

def index
end

    
def show
end

    def set_defaults
      self.picurl ||= 'photo_not_available.png'
    end


end

