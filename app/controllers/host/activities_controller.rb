class Host::ActivitiesController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
    @activities = @member.activities.order(created_at: :desc)
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
    if @activity.valid?
      @activity.status = Activity.statuses["pending"]
      @activity.save
      redirect_to host_path
    else
      render :new
    end
  end


  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    if @activity.update activity_params
      redirect_to [:host, @activity]
    else
      render :new
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:activity_id])
    @image.purge
    redirect_back(fallback_location: host_activities_path)
  end

  private

  def activity_params
    params.require(:activity).permit(:member_id, :location, :category, :intro, :overview, :address01, :address02, :zipcode, :legal_requirement, :host_arrangement, :participant_preparation, :notes, :price, :title, :status, :alcohol_served, :minimum_age, :how_active, :additional_requirement, :id_required, :group_size, :total_time, images: [])
  end
end