class Product < ActiveRecord::Base
    
    is_impressionable
    acts_as_commontable
    
    
    
    after_initialize :set_defaults
    
    has_and_belongs_to_many :users
    belongs_to :category
    
    validates_presence_of :title
    validates_presence_of :picurl
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

def set_defaults
    self.msrp  ||= 0.0
    self.price ||= 0.0
    self.picurl ||= 'https://massdump-merlin2049er.c9users.io/assets/photo_not_available.png'
end


    
end
