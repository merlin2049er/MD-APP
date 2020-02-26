# frozen_string_literal: true
require 'elasticsearch'
require 'elasticsearch/model'


class Product < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  is_impressionable

  # acts_as_commontable
  #include TheComments::Commentable

  after_initialize :set_defaults

  # has_and_belongs_to_many :users
  # add cart here...
  belongs_to :cart
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

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

  validates_date :startdate, before: :enddate,
  before_message: 'must be at before the end date.'

  # hopefully this works
  #  validates_numericality_of :qty, less_than_or_equal_to: 10, greater_than: 0

  def commentable_title
     "Undefined Post Title"
   end

   def commentable_url
     "#"
   end

   def commentable_state
     "published"
   end



  def set_defaults
    self.msrp ||= 0.0
    self.price ||= 0.0
    self.picurl ||= '/photo_not_available.png'
    self.qty ||= 1

    self.funded ||= 'false'
    self.courier ||= 'Canada Post'
    self.courierurl ||= 'https://www.canadapost.ca'
  end

  # default_scope { where(draft: false, active: true, funded: false ) }
  # default_scope { where(draft: false, active: true  ) }
  # default_scope { where( 'enddate > ?', DateTime.now ) }

  scope :published, -> {
    where(draft: false)
    .where(active: true)
    .where(funded: false)
    .where('startdate < ? OR enddate > ?' , DateTime.now.to_s, DateTime.now.to_s  )
  }

  # scope :incart , -> { where(draft: false, active: true ) }

  scope :most_recent, ->(limit) { order('created_at desc').limit(limit) }
  scope :ending_soonest, ->(limit) { order('enddate desc').limit(limit) }


  def self.search(query)

    if !query.blank?
     product =  __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title', 'template']
          }
        },
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            title:   {},
            template: {}
          }

        }
      }
      )
    else
      product = Product.published
    end
    return product
  end



end
