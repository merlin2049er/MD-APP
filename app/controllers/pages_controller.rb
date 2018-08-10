class PagesController < ApplicationController
  include Pagy::Backend


  add_breadcrumb "MASSDUMP", :root_path
#  add_breadcrumb "contacts", :contact_path
#  add_breadcrumb "about", :about_path
#  add_breadcrumb "error", :error_path

#  before_action :authenticate_user!


  def index
    add_breadcrumb "home", index_path

    @recent_products = Product.most_recent(9)

    @last_chance = Product.ending_soonest(9)

  ###  @mostviews = Product.impressions(8)

  end

  # def contacts
  #   add_breadcrumb "contact", contact_path
  # end

  def contact
     add_breadcrumb "contact", pages_contact_path
    @contact = Contact.new
  end

  def invite
    add_breadcrumb "invite", pages_invite_path
    @invite = Invite.new
    @message = 'Hi, please check out this awesome site and get in on the savings.'
  end

  def about
     add_breadcrumb "about", about_path
  end

  def error
     add_breadcrumb "error", error_path
  end

  def terms
     add_breadcrumb "terms", terms_path
  end

  def faq
    add_breadcrumb "faq", terms_path
  end

  def chartsgraphs

  add_breadcrumb "Charts and Graphs", chartsgraphs_path

  Chartkick.options = {
      height: "400px",
      colors: ["pink", "#999"]
  }


  end


  def dashboard



    add_breadcrumb "dashboard", dashboard_path

    # user model queries
    @superuser = User.where('admin' => true )

    @toptenlogin = User.limit(10).order("sign_in_count DESC")

    @lasttenlogin = User.limit(10).order("last_sign_in_at DESC")


    # products model queries

    @toptenending = Product.limit(10).order("enddate DESC")
    @toptenproductsstarted = Product.limit(10).order("startdate ASC")

    @toptenpricy = Product.limit(10).order("Price DESC")
    @toptencheap = Product.limit(10).order("Price ASC")

   # counts
    #items in cart
    @cartcount = Cart.count
    @draftcount =Product.where('draft' => true).count

    @successfully =Product.where('funded' => true).count
    @unsuccessfully =Product.where('funded' => false).count

    @unconfirmeduser = User.where('confirmed_at =?', nil ).count
    @registeredusers = User.count

    @totalnotifications = Notification.count
    @totaltransactions = Transaction.count


  end

  def invoicing

    add_breadcrumb "invoicing", invoicing_path


    @totalinvoices = Cart.where('processing' => true).count

    @invoiceusers = Cart.includes(:user).where('processing' => true)
    @pagy, @invoiceusers = pagy(@invoiceusers)

  end

  def invitations

    add_breadcrumb "invitations", invitations_path
    @totalinvites = Invite.count

    @totalregistered = 0

    @inivitesusers = Invite
    @pagy, @inivitesusers = pagy(@inivitesusers)

  end


end
