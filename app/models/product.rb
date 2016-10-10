class Product < ActiveRecord::Base
    
    belongs_to :category
    
    validates_presence_of :title
    validates_presence_of :template
    validates_presence_of :price
    validates_presence_of :msrp
    validates_presence_of :Startdate
    validates_presence_of :enddate
    
    validates_date :Startdate, :before => :enddate, 
                               :before_message => "must be at before the end date."
    
def edit
    
end

def index

    
end

    
def show
    
end


    
end
