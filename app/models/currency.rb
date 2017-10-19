class Currency < ActiveRecord::Base
  has_many :buy
  has_many :sell


    # % da Compra
  Value_in_buy = 1.01741
  # % do Imposto
  Value_tax = 1.011
  # % da Venda
  Value_in_sell = 1.02862

  def self.buy_calculator(currency)
    currency *= Value_in_buy
    currency *= Value_tax
    currency
  end

  def self.sell_calculator(currency)
    currency *= Value_in_sell
    currency *= Value_tax
    currency
  end
end
