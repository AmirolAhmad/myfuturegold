class VoucherMailer < ActionMailer::Base
  default from: '"MyFutureGold Resouces" <hello@myfuturegold.my>'

  def voucher_email(voucher)
    @voucher = voucher

    pdf = VoucherPdf.new(@voucher, view_context)
    attachments["payment_voucher.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }

    mail(
      :to => "#{voucher.user.login} <#{voucher.user.email}>",
      :subject => "New voucher #{voucher.receipt_number} has been added!"
      )
   end

   def notify_admin(voucher)
    @voucher = voucher

    mail(
      :to => "order@myfuturegold.my",
      :subject => "New voucher has been created!"
    )
   end
end
