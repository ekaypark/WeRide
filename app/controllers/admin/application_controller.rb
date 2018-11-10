class Admin::ApplicationController < ApplicationController
  before_action :ensure_admin
  layout 'admin'

  private

  def ensure_admin
    if member_signed_in? && current_member.admin?
      nil
    else
      raise
    end
  end

end