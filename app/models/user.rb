# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :notifications
  has_many :transactions
  # add cart here
  # has_and_belongs_to_many :product

  #acts_as_commontator
  # include TheComments::User

   # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM
 def admin?
   self == User.first
 end

 # YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
 def comments_admin?
   admin?
 end

 def comments_moderator? comment
   id == comment.holder_id
 end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
    end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.firstname = auth.info.first_name # assuming the user model has a name
      user.lastname = auth.info.last_name # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
      user.save!
    end
  end

  def set_defaults
    self.image ||= '/photo_not_available.png'
  end
  # include PublicActivity::Model
  #  tracked owner: ->(controller,model) {controller && controller.current_user}
end
