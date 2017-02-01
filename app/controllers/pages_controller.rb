class PagesController < ApplicationController
  
  add_breadcrumb "MASSDUMP", :root_path
#  add_breadcrumb "contacts", :contact_path
#  add_breadcrumb "about", :about_path
#  add_breadcrumb "error", :error_path
  
  def index
    add_breadcrumb "home", index_path
  end

  def contacts
     add_breadcrumb "contact", contact_path
  end
  
  def contact
     add_breadcrumb "contact", pages_contact_path
    @contact = Contact.new
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

  def dashboard
    add_breadcrumb "dashboard", dashboard_path

    # user model queries
    @superuser = User.where('admin' => true )

    @toptenlogin = User.limit(10).order("sign_in_count DESC")

    @lasttenlogin = User.limit(10).order("last_sign_in_at DESC")


    # products model queries

    @toptenending = Product.limit(10).order("enddate DESC")
     @toptenproductsstarted = Product.limit(10).order("Startdate ASC")

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

end
