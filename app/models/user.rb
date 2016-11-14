class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         

  has_many :notifications
  # add cart here
  #has_and_belongs_to_many :product
  
  acts_as_commontator

  
 # include PublicActivity::Model
 #  tracked owner: ->(controller,model) {controller && controller.current_user}
  
end
