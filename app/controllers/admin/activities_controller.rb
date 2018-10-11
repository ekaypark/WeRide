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

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    @activity.member = current_member
    @activity.status = Activity::statuses[:signature]
    if @activity.save
      redirect_to admin_activities_path
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    if @activity.update activity_params
      redirect_to [:admin, @activity]
    else
      render :new
    end
  end

  def approve
    @activity = Activity.find params[:id]
    @activity.approved!
    redirect_to [:admin, @activity]
  end

  private

  def activity_params
    params.require(:activity).permit(:member_id, :location, :category, :intro, :overview, :address01, :address02, :zipcode, :legal_requirement, :host_arrangement, :participant_preparation, :notes, :price, :title, :status, :alcohol_served, :minimum_age, :how_active, :additional_requirement, :id_required, :group_size, :total_time)
  end
end