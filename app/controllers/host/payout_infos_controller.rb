class Host::PayoutInfosController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
    @infos = @member.payout_infos.order(created_at: :desc)
  end

  def new
    @member = current_member
    @info = @member.payout_infos.new
  end

  def create
    @member = current_member
    @info = PayoutInfo.new payout_info_params
    @info.member = @member
    if @member.payout_infos.nil? || @member.payout_infos.all?{|info| info.default_use == false}
      @info.default_use = true
    end

    if @info.save
      redirect_to host_payout_infos_path
    else
      render :new
    end
  end

  def make_default
    @member = current_member
    @info = PayoutInfo.find params[:id]
    if @info.update_column(:default_use, true)
      @member.payout_infos.where.not(id: params[:id]).each do |info|
        info.update_column(:default_use, false)
      end
      redirect_to host_payout_infos_path
    end
  end

  private

  def payout_info_params
    params.require(:payout_info).permit(:member_id, :bank_name, :account_holder_name, :account_number)
  end
end