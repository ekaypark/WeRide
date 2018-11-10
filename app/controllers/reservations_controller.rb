class ReservationsController < ApplicationController
  before_action :authenticate_member!
  def new
    @activity = Activity.find params[:activity_id]
    @schedule = Schedule.find params[:schedule_id]
    @reservation = Reservation.new
  end

  def create
    @schedule = Schedule.find params[:reservation][:schedule_id]
    @activity = @schedule.activity


    @reservation = Reservation.new reservation_params
    if @reservation.save
      redirect_to my_page_reservations_path
    else
      render action: :new, params: {activity_id: @activity, schedule_id: @schedule}
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :participant_count, :member_id)
  end
end