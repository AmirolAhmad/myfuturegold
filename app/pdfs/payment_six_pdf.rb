class PaymentSixPdf < Prawn::Document
  require 'prawn/table'

  def initialize(payment, view)
    super()
    @payment = payment
    @view = view
    logo
    address
    client_details
    order_details
    akad_wakalah
    message
  end

  def logo
    text "RECEIPT", :align => :right, size: 16, :color => "585858", :style => :bold
    text "RECEIPT NUMBER: #{@payment.receipt_number}", :align => :right, size: 7, :color => "585858"
    text "DATE: #{@payment.created_at.strftime("%d/%m/%Y")}", :align => :right, size: 7, :color => "585858"
    logopath =  "#{Rails.root}/app/assets/images/pdf-logo.png"
    image logopath, :width => 90, :height => 100, :position => :left
    move_down 5
  end

  def address
    move_down 5
    text "MyFuture Gold Resources (002357358-K)", :size => 8, :style => :bold
    move_down 2
    text "No 117, Jalan Raja Abdullah", :size => 8, :color => "585858"
    text "50300 Wilayah Persekutuan", :size => 8, :color => "585858"
    text "Kuala Lumpur, MALAYSIA", :size => 8, :color => "585858"
    text "Tel: 03-8988 9909 | H/P: 012-2873632", :size => 8, :color => "585858"
    text "Email: order@myfuturegold.my", :size => 8, :color => "585858"
  end

  def client_details
    move_down 10
    text "TO:", :size => 8, :style => :bold
    text "#{@payment.user.profile.nama_penuh.titleize} (IC Number: #{@payment.user.profile.ic_number})", :size => 8, :color => "585858"
    text "#{@payment.user.profile.address1}", :size => 8, :color => "585858"
    text "#{@payment.user.profile.address2}", :size => 8, :color => "585858"
    text "#{@payment.user.profile.postcode} #{@payment.user.profile.city}", :size => 8, :color => "585858"
    text "#{@payment.user.profile.state}, #{@payment.user.profile.country}", :size => 8, :color => "585858"
    text "Email: #{@payment.user.email}", :size => 8, :color => "585858"
    move_down 10
    # client_name = "#{@payment.user.profile.nama_penuh.titleize}"
    # ic_number = "#{@payment.user.profile.ic_number}"

    # text "INVOICE #{@payment.receipt_number}"
    # text "DATE: #{@payment.created_at.strftime("%d/%m/%Y")}"

    # table([ [client_name, ic_number] ], :cell_style => {:size => 8, :text_color => "585858", :border_width => 1})
  end

  def order_details
    move_down 10
    data = [["Programme", "Total Weight (grams)", "Price per gram", "Total Price"]]
    data += [["#{@payment.order.package.package_name}", "#{@payment.order.gram_quantity}", "RM #{@payment.order.price}", "RM #{@payment.total_payment}"]]

    table(data, :header => true, :cell_style => {:size => 8, :text_color => "585858"}, :width => 530) do
      cells.padding = 8
      cells.borders = []
      row(0).borders = [:bottom, :left, :right, :top]
      row(0).border_width = 1
      row(0).font_style = :bold

      columns(0..4).borders = [:bottom, :left, :right, :top]
      row(0).columns(0..4).borders = [:bottom, :left, :right, :top]
    end
  end

  def akad_wakalah
    move_down 20
    text "AKAD BELI :", :size => 8, :style => :bold
    text "Dengan ini, saya bersetuju melantik Nama: #{@payment.user.profile.nama_penuh.titleize} dan Kad Pengenalan bernombor: #{@payment.user.profile.ic_number} sebagai wakalah atas urus niaga emas bagi pihak saya untuk membeli Emas 999.9 seberat #{@payment.order.gram_quantity}gram daripada KJ Gold dengan harga RM #{@payment.order.price}/gram secara tangguh selama sebulan.", :size => 9, :color => "585858", :style => :italic
  end

  def message
    move_down 300
    text '"THIS IS A COMPUTER-GENERATED DOCUMENT AND IT DOES NOT REQUIRE A SIGNATURE. THIS DOCUMENT SHALL NOT BE INVALIDATED SOLELY ON THE GROUND THAT IT IS NOT SIGNED. "', :color => "585858", :size => 7, :align => :center, :style => :bold
  end

end