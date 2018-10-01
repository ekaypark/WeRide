class MyPagesController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
    redirect_to new_member_guide_path if @member.activities.none?
  end



  # def edit

  # end

  # protected
  #   def after_update_path_for(resource)
  #     member_path(resource)
  #   end
end
