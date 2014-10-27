class OrderMailer < ActionMailer::Base
  default from: '"MyFutureGold Resouces" <hello@myfuturegold.my>'

  def order_email(user, order)
    @user = user
    @order = order

    mail(:to => "#{user.login} <#{user.email}>", :subject => "New Order Created!")
   end
end
