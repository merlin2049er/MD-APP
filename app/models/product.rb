class Product < ActiveRecord::Base
    
     #include PublicActivity::Model
     #tracked owner: Proc.new{ |controller, model| controller.current_user }
    
    is_impressionable
    acts_as_commontable
    
    
    
    after_initialize :set_defaults
    
    # has_and_belongs_to_many :users
    # add cart here...
    belongs_to :category
    has_many :photos

    
    validates_presence_of :title
    validates_presence_of :picurl
    validates_presence_of :template
    validates_presence_of :qty
    validates_presence_of :price
    validates_presence_of :msrp
    validates_presence_of :Startdate
    validates_presence_of :enddate
    
    validates_date :Startdate, :before => :enddate, 
                               :before_message => "must be at before the end date."

    # hopefully this works
    validates_numericality_of :qty, less_than_or_equal_to: 10, greater_than: 0
                               

    
def edit
    
end

def index

    
end

    
def show
   
end

def set_defaults
    self.msrp  ||= 0.0
    self.price ||= 0.0
    self.picurl ||= 'https://cryptic-inlet-13518.herokuapp.com/photo_not_available.png'
    self.qty ||= 1
end


    
end
