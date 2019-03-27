# frozen_string_literal: true

class Invite < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message

  validates :email, email: true

  validates_uniqueness_of :email
end
