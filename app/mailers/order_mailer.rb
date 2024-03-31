class OrderMailer < ApplicationMailer
  def ordered_email(order)
    @order = order
    mail(to: @order.email, subject: '【ご注文ありがとうございます】注文確定のお知らせ')
  end
end
