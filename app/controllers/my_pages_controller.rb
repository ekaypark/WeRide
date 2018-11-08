class MyPagesController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
  end

  # protected
  #   def after_update_path_for(resource)
  #     member_path(resource)
  #   end
end
