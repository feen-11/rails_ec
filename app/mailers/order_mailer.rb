class OrderMailer < ApplicationMailer
  def ordered_email(order)
    @order = order
    mail(to: @order.email, subject: '注文確認メール')
  end
end
