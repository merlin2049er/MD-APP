class Product < ActiveRecord::Base

     #include PublicActivity::Model
     #tracked owner: Proc.new{ |controller, model| controller.current_user }

    is_impressionable
    acts_as_commontable

    after_initialize :set_defaults

    # has_and_belongs_to_many :users
    # add cart here...
    belongs_to :cart
    belongs_to :category
    has_many :photos

    validates_presence_of :title
    validates_presence_of :picurl
    validates_presence_of :template
    validates_presence_of :qty
    validates_presence_of :price
    validates_presence_of :msrp
    validates_presence_of :startdate
    validates_presence_of :enddate
    # validates_presence_of :length
    # validates_presence_of :width
    # validates_presence_of :height
    # validates_presence_of :weight
    # validates_presence_of :courier
    # validates_presence_of :courierurl

    validates_length_of :title, maximum: 35


    validates_date :startdate, :before => :enddate,
                               :before_message => "must be at before the end date."

    # hopefully this works
    validates_numericality_of :qty, less_than_or_equal_to: 10, greater_than: 0


def set_defaults
    self.msrp  ||= 0.0
    self.price ||= 0.0
    self.picurl ||= 'photo_not_available.png'
    self.qty ||= 1

    self.courier ||= 'Canada Post'
    self.courierurl ||= 'https://www.canadapost.ca'

end


    #default_scope { where(draft: false, active: true, funded: false ) }
    default_scope { where(draft: false, active: true ) }
    default_scope { where( 'enddate > ?', DateTime.now ) }


    scope :most_recent, ->(limit) { order("created_at desc").limit(limit) }
    scope :ending_soonest, ->(limit) { order("enddate desc").limit(limit) }

end
