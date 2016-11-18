class ActivitiesController < ApplicationController
  def index
    add_breadcrumb "MASSDUMP"  
    add_breadcrumb "activity", activities_path
    @activities = PublicActivity::Activity.order("created_at desc")
  end
end