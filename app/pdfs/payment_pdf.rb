class PaymentPdf < Prawn::Document
  require 'prawn/table'

  def initialize(payment, view)
    super()
    @payment = payment
    @view = view
    # text "Receipt Number: #{@payment.receipt_number}", :size => 9, :color => "585858"
    logo
    address
    order_details
    thanks_message
    payment_date
    payment_method
    client_name
    order_number
    package_name
    payment_amount
    payment_status
    message
    thank_you
  end

  def logo
    text "RECEIPT", :align => :right, size: 16, :color => "585858", :style => :bold
    logopath =  "#{Rails.root}/app/assets/images/pdf-logo.png"
    image logopath, :width => 90, :height => 100, :position => :left
    move_down 10
  end

  def address
    move_down 5
    text "MyFuture Gold Resources (002357358-K)", :size => 8, :style => :bold
    move_down 5
    text "No 117, Jalan Raja Abdullah", :size => 8, :color => "585858"
    text "50300 Wilayah Persekutuan", :size => 8, :color => "585858"
    text "Kuala Lumpur, MALAYSIA", :size => 8, :color => "585858"
    text "Tel: 03-8988 9909 | H/P: 012-2873632", :size => 8, :color => "585858"
    text "Email: order@myfuturegold.my", :size => 8, :color => "585858"
  end

  def order_details
    text "INVOICE #{@payment.receipt_number}", :size => 8, :color => "585858"
    text "DATE: #{@payment.created_at.strftime("%d/%m/%Y")}", :size => 8, :color => "585858"
  end

  def thanks_message
    move_down 10
    text "Here is your payment confirmation details that has been created to your account by MyFuture Gold Resources. Please print and keep this receipt as confirmation of your payment for your future reference.", :size => 9, :color => "585858"
  end

  def payment_date
    move_down 30
    text "<font size=\"9\"><color rgb=\"585858\">Date of Payment:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.created_at.strftime("%d/%m/%Y")}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Date of Voucher:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.created_at.strftime("%d/%m/%Y")} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def payment_method
    text "<font size=\"9\"><color rgb=\"585858\">Voucher Method:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.method}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Voucher Method:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.method}", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def client_name
    text "<font size=\"9\"><color rgb=\"585858\">Client Name:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.user.profile.nama_penuh.titleize}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Client Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.user.profile.nama_penuh.titleize} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def order_number
    text "<font size=\"9\"><color rgb=\"585858\">Order Number:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.order.ref_number}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Order Number:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.ref_number} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def package_name
    text "<font size=\"9\"><color rgb=\"585858\">Package Name:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.order.package.package_name}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Package Name:", :size => 9, :color => "585858"
    # move_down 5
    # text "#{@voucher.order.package.package_name} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def payment_amount
    text "<font size=\"9\"><color rgb=\"585858\">Total Payment:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>RM #{@payment.total_payment}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
    # text "Voucher Amount:", :size => 9, :color => "585858"
    # move_down 5
    # text "RM #{@voucher.total_payment} ", :size => 9, :color => "585858", :style => :bold
    move_down 10
  end

  def payment_status
    text "<font size=\"9\"><color rgb=\"585858\">Payment Status:</color></font> <font size=\"9\"><color rgb=\"585858\"><b>#{@payment.status}</b></color></font>", :inline_format => true, :indent_paragraphs => 20
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
    move_down 160
    text "Thank You", :color => "eeeeee", :size => 40, :style => :bold
  end

end