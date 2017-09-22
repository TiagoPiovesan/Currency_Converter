class Sell < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :currency_input
  belongs_to :currency_out

  validates :value_input, numericality: true

end
