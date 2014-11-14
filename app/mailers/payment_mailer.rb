class PaymentMailer < ActionMailer::Base
  default from: '"MyFutureGold Resouces" <hello@myfuturegold.my>'

  def payment_email(payment)
    @payment = payment

    pdf = PaymentPdf.new(@payment, view_context)
    attachments["receipt.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }

    mail(
      :to => "#{payment.user.login} <#{payment.user.email}>",
      :subject => "New payment #{payment.receipt_number} has been added!"
      )
   end

   def notify_admin(payment)
    @payment = payment

    mail(
      :to => "order@myfuturegold.my",
      :subject => "New payment has been created by #{payment.user.login}!"
    )
   end
end
