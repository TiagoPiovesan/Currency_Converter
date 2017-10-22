class SaleMailer < ApplicationMailer

  def buy_email(current_user, customer)
    @user = current_user
    @customer = customer
    mail(to: @customer.email, subject: "Você Acabou de fazer uma compra!")
  end

  def sell_email(current_user, customer)
    @user = current_user
    @customer = customer
    mail(to: @customer.email, subject: "Você Acabou de fazer uma cambiação!")
  end

end