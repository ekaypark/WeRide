class Host::SchedulesController < ApplicationController
  before_action :authenticate_member!


  def show
    @member = current_member
    @schedules = @member.schedules.order(created_at: :desc)
  end

  def create
    dates = params[:dates].split(',').to_a
    start_time = params[:start_time]
    end_time = params[:end_time]
    activity_id = params[:activity_id]

    (0...dates.count).each do |i|
      Schedule.create(
        member_id: current_member.id,
        activity_id: activity_id,
        start_at: DateTime.parse(dates[i] + " " + start_time),
        end_at: DateTime.parse(dates[i] + " " + end_time)
      )
    end
    redirect_to host_schedule_path
  end
end