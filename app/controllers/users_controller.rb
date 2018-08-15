class UsersController < ApplicationController
  include Pagy::Backend

  #before_filter :authenticate_admin!, :except => [:show]
  before_action :authenticate_user!
  add_breadcrumb "MASSDUMP", :root_path

  def index
    add_breadcrumb "Users"

    @total = User.count
    @pagy, @users = pagy(User.all)

  end

  # def show
  #  @user = User.find_by_username(params[:id])
  # end
  #
end