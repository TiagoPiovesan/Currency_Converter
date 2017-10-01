class Buy < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :currency


  validates :value_input, :customer, :user, :currency_input_id, :currency_out_id, presence: true
  validates :value_input, numericality: { greater_than: 0 }

  
end
