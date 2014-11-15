class ItemPdf < Prawn::Document
  require 'prawn/table'

  def initialize(item, view)
    super()
    @item = item
    @view = view
    logo
    address
    client_details
    order_details
    message
  end

  def logo
    text "RECEIPT", :align => :right, size: 16, :color => "585858", :style => :bold
    text "RECEIPT NUMBER: #{@item.receipt_number}", :align => :right, size: 7, :color => "585858"
    text "DATE: #{@item.created_at.strftime("%d/%m/%Y")}", :align => :right, size: 7, :color => "585858"
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
    text "#{@item.user.profile.nama_penuh.titleize} (IC Number: #{@item.user.profile.ic_number})", :size => 8, :color => "585858"
    text "#{@item.user.profile.address1}", :size => 8, :color => "585858"
    text "#{@item.user.profile.address2}", :size => 8, :color => "585858"
    text "#{@item.user.profile.postcode} #{@item.user.profile.city}", :size => 8, :color => "585858"
    text "#{@item.user.profile.state}, #{@item.user.profile.country}", :size => 8, :color => "585858"
    text "Email: #{@item.user.email}", :size => 8, :color => "585858"
    move_down 10
  end

  def order_details
    move_down 10
    data = [["Item Description","Programme", "Date Received Item", "Total Gram Received"]]
    data += [["#{@item.item_type}","#{@item.order.package.package_name}", "#{@item.date_received}", "#{@item.gram_received}gram"]]

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

  def message
    move_down 350
    text '"THIS IS A COMPUTER-GENERATED DOCUMENT AND IT DOES NOT REQUIRE A SIGNATURE. THIS DOCUMENT SHALL NOT BE INVALIDATED SOLELY ON THE GROUND THAT IT IS NOT SIGNED. "', :color => "585858", :size => 7, :align => :center, :style => :bold
  end

end