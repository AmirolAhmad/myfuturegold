class OrderMailer < ActionMailer::Base
  default from: '"MyFutureGold Resouces" <hello@myfuturegold.my>'

  def order_email(order)
    @order = order

    mail(
      :to => "#{order.user.login} <#{order.user.email}>",
      :subject => "New Order #{order.ref_number} has been place!"
      )
   end

   def notify_admin(order)
    @order = order

    mail(
      :to => "hisyamnasir@gmail.com",
      :subject => "New order has been created by #{order.user.login}!"
    )
   end
end
