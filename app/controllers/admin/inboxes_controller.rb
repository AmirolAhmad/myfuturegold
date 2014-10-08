class Admin::InboxesController < ApplicationController
  before_filter :set_inbox, only: [:show, :destroy]
  before_filter :store_location, only: [:index]
  before_filter :require_admin

  def index
    @inboxes = Inbox.all
    respond_to do |format|
      format.html { @inboxes }
      format.json { render json: @inboxes.to_json(include: [:user]) }
    end
  end

  def show
    if @inbox
      @inboxes = Inbox.hash_tree
      @inbox.update_attributes(:unread => true)
      respond_to do |format|
        format.html { @inbox }
        format.json { render json: @inbox.to_json(include: [:user]) }
      end
    else
      redirect_to admin_inboxes_path, notice: "Messages not found."
    end
  end

  def new
    @inbox ||= Inbox.new(parent_id: params[:parent_id])
    render
  end

  def new_reply
    @inbox ||= Inbox.new(parent_id: params[:parent_id])
    render
  end

  def create
    #@inbox = Inbox.new(inbox_params)

    if params[:inbox][:parent_id].to_i > 0
      parent = Inbox.find_by_id(params[:inbox].delete(:parent_id))
      @inbox = parent.children.build(inbox_params)
    else
      @inbox = Inbox.new(inbox_params)
    end

    if @inbox.save
      redirect_to admin_inboxes_path, notice: "New message has been created."

      random = ['1'..'9'].map { |i| i.to_a }.flatten
      ticket_id = (0...4).map { random[rand(random.length)] }.join
      @inbox.update_attributes(:ticket_id => "#MGR-" + ticket_id)
    else
      render 'new'
    end
  end

  def destroy
    @inbox.destroy
    redirect_to admin_inboxes_path, notice: "Message has been deleted."
  end

  private

  def set_inbox
    @inbox = Inbox.find(params[:id])
  end
end
