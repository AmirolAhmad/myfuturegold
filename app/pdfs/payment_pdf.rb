class PaymentPdf < Prawn::Document

  def initialize(payment, view)
    super()
    @payment = payment
    @view = view
    text "Order Number: ##{@payment.order.ref_number}"
    thanks_message
    order_date
  end

  def thanks_message
    move_down 80
    text "Hello #{@payment.user.profile.nama_penuh.titleize},"
    move_down 15
    text "Thank you for your payment. Print this receipt as confirmation of your payment for your future references.",
    :indent_paragraphs => 40, :size => 13
  end

  def order_date
    move_down 40
    text "Date of payment: 
    #{@payment.created_at.strftime("%d/%m/%Y")} ", :size => 13
    move_down 20
  end

end