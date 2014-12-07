class VouchersController < ApplicationController
  before_filter :set_user, only: [:index, :show]
  before_filter :require_user

  def index
    @vouchers = Voucher.where(user_id: @user)
    respond_to do |format|
      format.html { @vouchers }
      format.json { render json: @vouchers.to_json(include: [:user, :order]) }
    end
  end

  def show
    @voucher = Voucher.where(id: params[:id], user: @user).take
    if @voucher
      respond_to do |format|
        format.html { @voucher }
        format.json { render json: @voucher.to_json(include: [:user, :order]) }
        format.pdf do
          if @voucher.order.package_id != 6
            pdf = VoucherPdf.new(@voucher, view_context)
            send_data pdf.render, filename:
            "voucher#{@voucher.created_at.strftime("%d/%m/%Y")}.pdf",
            type: "application/pdf",
            disposition: "inline"
          else
            pdf = VoucherSixPdf.new(@voucher, view_context)
            send_data pdf.render, filename:
            "voucher#{@voucher.created_at.strftime("%d/%m/%Y")}.pdf",
            type: "application/pdf",
            disposition: "inline"
          end
        end
      end
    else
      redirect_to vouchers_path, notice: "Voucher ID not found for that client."
    end
  end

  private

  def set_user
    @user = current_user
  end
end
