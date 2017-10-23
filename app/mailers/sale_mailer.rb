class SaleMailer < ApplicationMailer

  def buy_email(current_user, customer, currency_input, currency_out, value_input, value_out, created_at)
    @user = current_user
    @customer = customer
    @currency_input = currency_input
    @currency_out = currency_out
    @value_input = value_input
    @value_out = value_out
    @created_at = created_at
    
    mail(to: @customer.email, subject: "Você Acabou de fazer uma compra!")
  end

  def sell_email(current_user, customer, currency_input, currency_out, value_input, value_out, created_at)
    @user = current_user
    @customer = customer
    @currency_input = currency_input
    @currency_out = currency_out
    @value_input = value_input
    @value_out = value_out
    @created_at = created_at

    mail(to: @customer.email, subject: "Você Acabou de fazer uma cambiação!")
  end

end