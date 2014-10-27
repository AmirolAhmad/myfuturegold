class PaymentPdf < Prawn::Document

  def initialize(payment, view)
    super()
    @payment = payment
    @view = view
    text "Receipt Number: #{@payment.receipt_number}", :size => 9, :color => "585858"
    logo
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

  def address
    move_down 10
    text "MyFuture Gold Resources", :size => 10, :style => :bold
    move_down 5
    text "H5-20 Flora Damansara, Jalan PJU 8/9", :size => 9, :color => "cccccc"
    text "Bandar Damansara Perdana", :size => 9, :color => "cccccc"
    text "47820 Petaling Jaya", :size => 9, :color => "cccccc"
    text "Selangor, MALAYSIA", :size => 9, :color => "cccccc"
  end

end