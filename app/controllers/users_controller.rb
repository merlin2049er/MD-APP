# frozen_string_literal: true

class UsersController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!


  def index
    add_breadcrumb 'MASSDUMP',  :'root_path'
    add_breadcrumb 'Users'

    @total = User.count
    @pagy, @users = pagy(User.all)
  end

  # def show
  #  @user = User.find_by_username(params[:id])
  # end
  #
end
