class VoucherPdf < Prawn::Document

  def initialize(voucher, view)
    super()
    @voucher = voucher
    @view = view
    text "Order Number: #{@voucher.order.ref_number}"
    thanks_message
    order_date
  end

  def thanks_message
    move_down 80
    text "Hello #{@voucher.user.profile.nama_penuh.titleize},"
    move_down 15
    text "Thank you for your voucher. Print this receipt as confirmation of your voucher for your future references.",
    :indent_paragraphs => 40, :size => 13
  end

  def order_date
    move_down 40
    text "Date of voucher: 
    #{@voucher.created_at.strftime("%d/%m/%Y")} ", :size => 13
    move_down 20
  end

end