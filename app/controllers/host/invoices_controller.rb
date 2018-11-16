class Host::InvoicesController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
    if params[:payout_status].present?
      @invoices = @member.invoices.where(status: params[:payout_status]).order(created_at: :desc)
    else
      @invoices = @member.invoices.pending.order(created_at: :desc)
    end
  end
end