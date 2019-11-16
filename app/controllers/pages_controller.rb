# frozen_string_literal: true

class PagesController < ApplicationController
  include Pagy::Backend

  add_breadcrumb 'MASSDUMP', :root_path

  def index
    add_breadcrumb 'home', index_path

    @recent_products = Product.published.most_recent(6)
    @last_chance = Product.published.ending_soonest(6)

  end

  def contact
    add_breadcrumb 'contact', pages_contact_path
    @contact = Contact.new
  end

  def invite
    add_breadcrumb 'invite', pages_invite_path
    @invite = Invite.new
    @message = 'Hi, please check out this awesome site and get in on the savings.'
  end

  def about
    add_breadcrumb 'about', about_path
  end

  def random
    add_breadcrumb 'random', random_path

    @random = Product.published.limit(12).order("RANDOM()")

  end

  def error
    add_breadcrumb 'error', error_path
  end

  def terms
    add_breadcrumb 'terms', terms_path
  end

  def privacy
    add_breadcrumb 'privacy', privacy_path
  end

  def cookies
    add_breadcrumb 'cookies', cookies_path
  end

  def jobs
     add_breadcrumb "jobs", jobs_path
  end


  def faq
    add_breadcrumb 'faq', terms_path
  end

  def chartsgraphs
    add_breadcrumb 'Charts and Graphs', chartsgraphs_path

    Chartkick.options = {
      height: '400px',
      colors: ['pink', '#999']
    }
  end

  def dashboard
    add_breadcrumb 'dashboard', dashboard_path

    # user model queries
    @superuser = User.where('admin' => true)

    @toptenlogin = User.limit(10).order('sign_in_count DESC')

    @lasttenlogin = User.limit(10).order('last_sign_in_at DESC')

    # products model queries

    @toptenending = Product.limit(10).order('enddate DESC')
    @toptenproductsstarted = Product.limit(10).order('startdate ASC')

    @toptenpricy = Product.limit(10).order('Price DESC')
    @toptencheap = Product.limit(10).order('Price ASC')

    @cartcount = Cart.count
    @draftcount = Product.where('draft' => true).count

    @successfully = Product.where('funded' => true).count
    @unsuccessfully = Product.where('funded' => false).count

    @unconfirmeduser = User.where('confirmed_at =?', nil).count
    @registeredusers = User.count

    @totalnotifications = Notification.count
    @totaltransactions = Transaction.count
  end

  def invitations
    add_breadcrumb 'invitations', invitations_path
    @totalinvites = Invite.count

    @totalregistered = 0

    @inivitesusers = Invite
    @pagy, @inivitesusers = pagy(@inivitesusers)
  end
end
