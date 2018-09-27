class ActivitiesController < ApplicationController
  before_action :authenticate_member!, except: :show

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    @activity.member = current_member
    if @activity.save
      redirect_to my_page_path
    else
      render 'new'
    end
  end

  def show
    @activity = Activity.find params[:id]
  end

  private

  def activity_params
    params.require(:activity).permit(:member_id, :location, :category, :intro, :overview, :address01, :address02, :zipcode, :legal_requirement, :host_arrangement, :participant_preparation, :notes, :price, :title)
  end
end