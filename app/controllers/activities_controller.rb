class ActivitiesController < ApplicationController
  before_action :authenticate_member!, except: :show

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    @activity.member = current_member
    if @activity.valid?
      @activity.status = Activity.statuses["pending"]
      @activity.save
      # probably need a different logic later e.g. host info.
      @activity.member.host! if @activity.member.user?
      redirect_to my_page_path
    else
      render 'new'
    end
  end

  def show
    @activity = Activity.find params[:id]
  end

  def edit
    @activity = Activity.find params[:id]
  end

  def update
    @activity = Activity.find params[:id]
    if @activity.update activity_params
      redirect_to @activity
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:member_id, :location, :category, :intro, :overview, :address01, :address02, :zipcode, :legal_requirement, :host_arrangement, :participant_preparation, :notes, :price, :title, :status, :alcohol_served, :minimum_age, :how_active, :additional_requirement, :id_required, :group_size, :total_time)
  end
end