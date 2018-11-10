class MyPage::ReservationsController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member

    @upcoming_reservations = @member.upcoming_reservations
    @passed_reservations = @member.passed_reservations
  end

  def cancel_request
    @reservation = Reservation.find params[:id]
    if @reservation.pending?
      @reservation.destroy
      redirect_to my_page_reservations_path
    elsif @reservation.confirmed?
      @reservation.cancel_requested!
      @reservation.update_column(:cancel_requested_at, Time.now)
    end
  end
end