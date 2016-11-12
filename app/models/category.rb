class Category < ActiveRecord::Base
    
    has_many :products
    
   validates_presence_of :name

def edit
end

def index
end

    
def show
end
    
    
def self.order_list(sort_order)
    if sort_order == "newest" || sort_order.blank?
       order(created_at :desc)
    else if sort_order == "name"
        order(created_at :name)
    else
         order(created_at :asc)
    end
    end
end 
end

