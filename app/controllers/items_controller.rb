class ItemsController < ApplicationController
  before_filter :set_user, only: [:index, :show]
  before_filter :require_user

  def index
    @items = Item.where(user_id: @user)
    respond_to do |format|
      format.html { @items }
      format.json { render json: @items.to_json(include: [:user, :order]) }
    end
  end

  def show
    @item = Item.where(id: params[:id], user: @user).take
    if @item
      respond_to do |format|
        format.html { @item }
        format.json { render json: @item.to_json(include: [:user, :order]) }
        format.pdf do
          pdf = ItemPdf.new(@item, view_context)
          send_data pdf.render, filename:
          "item#{@item.created_at.strftime("%d/%m/%Y")}.pdf",
          type: "application/pdf",
          disposition: "inline"
        end
      end
    else
      redirect_to items_path, notice: "Item ID not found for that client."
    end
  end

  private

  def set_user
    @user = current_user
  end
end
