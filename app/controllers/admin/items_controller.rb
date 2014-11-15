class Admin::ItemsController < ApplicationController
  before_filter :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :set_item
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @items = Item.where(user_id: @user).to_a
    respond_to do |format|
      format.html { @items }
      format.json { render json: @items.to_json(include: [:user, :order]) }
    end
  end

  def show
    if @item
      respond_to do |format|
        format.html { @items }
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
      redirect_to admin_user_items_path, notice: "Item History not found for that order."
    end
  end

  def new
    @item ||= Item.new
    render
  end

  def create
    @item = @user.items.new(item_params)
    if @item.save

      random = ['1'..'9'].map { |i| i.to_a }.flatten
      receipt_number = (0...4).map { random[rand(random.length)] }.join
      @item.update_attributes(:receipt_number => "#MFG-I" + receipt_number)

      ItemMailer.item_email(@item).deliver
      ItemMailer.notify_admin(@item).deliver

      redirect_to admin_user_item_path(id:@item), notice: "New item has been created."

      #send sms with twillio
      client = Twilio::REST::Client.new(Settings.twilio.sid, Settings.twilio.token)

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: Settings.twilio.from,
        to: "+6#{@user.profile.tel_num}",
        body: "Hi #{@user.login}, an item has been added into your account with receipt no #{@item.receipt_number}. Please login into your account to view. Thank you!"
      )

    else
      render 'new'
    end
  end

  def edit
    if @item
      render
    else
      redirect_to admin_user_items_path, notice: "Item ID not found."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to admin_user_item_path(id:@item), notice: "Receipt Number #{@item.receipt_number} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_user_vouchers_path, notice: "item history has been deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_item
    @item = Item.where(id: params[:id], user: @user).take
  end
end
