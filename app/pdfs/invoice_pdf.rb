class InvoicePdf < Prawn::Document

  def initialize(order, view)
    super()
    @order = order
    @view = view
    text "Reference Number: #{@order.ref_number}", :size => 9, :color => "585858"
    logo
    thanks_message
    order_date
    client_name
    order_number
    package_name
    total_weight
    discount_date
    status
    price
    total_price
    message
    thank_you
    address
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 197, :height => 91, :position => :center
    move_down 10
    text "Receipt", :align => :center, size: 22, :style => :italic
    move_down 5
    text "____________________", :align => :center, size: 9, :color => "999999"
    move_down 10
  end

  def thanks_message
    move_down 10
    text "Here is your invoice for order that has been created into your account by MyFuture Gold Resources. Please print and keep this invoice as confirmation of your payment.", :size => 9, :color => "585858"
  end

  def order_date
    move_down 30
    text "<font size=\"9\"><color rgb=\"585858\">Date of Order:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.created_at.strftime("%d/%m/%Y")}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Date of Voucher:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.created_at.strftime("%d/%m/%Y")} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def client_name
    text "<font size=\"9\"><color rgb=\"585858\">Client Name:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.user.profile.nama_penuh.titleize}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Client Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.user.profile.nama_penuh.titleize} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def order_number
    text "<font size=\"9\"><color rgb=\"585858\">Order Number:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.ref_number}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Order Number:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.ref_number} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def package_name
    text "<font size=\"9\"><color rgb=\"585858\">Package Name:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.package.package_name}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def total_weight
    text "<font size=\"9\"><color rgb=\"585858\">Total Weight:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.gram_quantity} gram</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def discount_date
    text "<font size=\"9\"><color rgb=\"585858\">Discount Date:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.discount.discount_date}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def status
    text "<font size=\"9\"><color rgb=\"585858\">Order Status:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@order.status.status_name}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def price
    text "<font size=\"9\"><color rgb=\"585858\">Price per gram:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>RM #{@order.price}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def total_price
    text "<font size=\"9\"><color rgb=\"585858\">Total Price:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>RM #{@order.total_price}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Voucher Amount:", :size => 9, :color => "585858"
    # move_down 5
    # text "RM #{@voucher.total_payment} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def message
    move_down 40
    text "For questions, contact us anytime at support@myfuturegold.my", :color => "585858", :size => 13, :align => :center, :style => :bold
  end

  def thank_you
    move_down 100
    text "Thank You", :color => "eeeeee", :size => 40, :style => :bold
  end

  def address
    move_down 10
    text "MyFuture Gold Resources (002357358-K)", :size => 10, :style => :bold
    move_down 5
    text "No 117, Jalan Raja Abdullah", :size => 9, :color => "cccccc"
    text "50300 Wilayah Persekutuan", :size => 9, :color => "cccccc"
    text "Kuala Lumpur, MALAYSIA", :size => 9, :color => "cccccc"
    text "Tel: 03-8988 9909 | H/P: 012-2873632", :size => 9, :color => "cccccc"
    text "Email: order@myfuturegold.my", :size => 9, :color => "cccccc"
  end

end