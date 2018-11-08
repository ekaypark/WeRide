class ActivitiesController < ApplicationController
  def index
    @tours = Activity.signature.available#.order(created_at: :desc)
    @activities = Activity.approved.available#.order(created_at: :desc)
  end

  def show
    @activity = Activity.find params[:id]
    @available_schedules = @activity.schedules.map{|s| s.start_at.strftime("%Y-%m-%d")}
  end

  def render_time_on_dates
    @activity = Activity.find params[:activity_id]
    @date = Date.parse(params[:selected_date])

    @schedules = @activity.schedules.where('start_at BETWEEN ? AND ?', @date.beginning_of_day, @date.end_of_day)

    if @schedules.present?
      html_string = render_to_string partial: '/application/render_date_for_reservation', locals: {schedules: @schedules}
      render json: {html_string: html_string}
    else
      render json: {status: 'not ok'}
    end
  end
end