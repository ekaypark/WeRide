class Admin::ActivitiesController < Admin::ApplicationController
  def index
    if params[:activity_status].present?
      @activities = Activity.where(status: params[:activity_status]).order(created_at: :desc)
    else
      @activities = Activity.pending.order(created_at: :desc)
    end
  end

  def show
    @activity = Activity.find params[:id]
  end

  def approve
    @activity = Activity.find params[:id]
    @activity.approved!
    redirect_to [:admin, @activity]
  end
end