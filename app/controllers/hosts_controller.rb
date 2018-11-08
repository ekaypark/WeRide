class HostsController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = current_member
  end
end