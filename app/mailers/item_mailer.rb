class ItemMailer < ActionMailer::Base
  default from: '"MyFutureGold Resouces" <hello@myfuturegold.my>'

  def item_email(item)
    @item = item

    pdf = ItemPdf.new(@item, view_context)
    attachments["item_receipt.pdf"] = { :mime_type => 'application/pdf', :content => pdf.render }

    mail(
      :to => "#{item.user.login} <#{item.user.email}>",
      :subject => "New item #{item.receipt_number} has been added!"
      )
   end

   def notify_admin(item)
    @item = item

    mail(
      :to => "order@myfuturegold.my",
      :subject => "New item has been created!"
    )
   end
end
