class Admin::ReservationsController < Admin::ApplicationController

  def index
    if params[:reservation_status].present?
      @reservations = Reservation.where(status: params[:reservation_status]).order(created_at: :desc)
    else
      @reservations = Reservation.pending.order(created_at: :desc)
    end
  end

  def update_status
    @reservation = Reservation.find params[:id]
    if @reservation.pending? && params[:admin_action] == "confirm"
      @reservation.confirmed!
      @reservation.update_column(:confirmed_at, Time.now)
    elsif @reservation.cancel_requested? && params[:admin_action] == "cancel"
      @reservation.cancelled!
      @reservation.update_column(:cancel_verdict_at, Time.now)
      # serialize data and then destroy the record.
    end
    redirect_to admin_reservations_path(reservation_status: @reservation.status)
  end
end