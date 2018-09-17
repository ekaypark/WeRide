class MyPagesController < ApplicationController
  before_action :authenticate_member!

  def show
    @user = current_member
  end

  # def edit

  # end

  # protected
  #   def after_update_path_for(resource)
  #     member_path(resource)
  #   end
end
