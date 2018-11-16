class Admin::InvoicesController < Admin::ApplicationController
  def index
    if params[:payout_status].present?
      @invoices = Invoice.where(status: params[:payout_status]).order(created_at: :desc)
    else
      @invoices = Invoice.pending.order(created_at: :desc)
    end
  end

  def complete_payout
    @invoice = Invoice.find params[:id]
    @invoice.complete!
    redirect_to admin_invoices_path
  end
end