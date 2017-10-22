class Sell < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :currency

  validates :value_input, :customer, :user, :currency_input_id, :currency_out_id, presence: true
  validates :value_input, numericality: { greater_than: 0 }


  private

    def self.calculate_output(value_input, currency_input_id, currency_out_id)
      
      unless currency_input_id == "" or currency_out_id == ""

        currency_input = Currency.find(currency_input_id).price.to_f
        currency_output = Currency.find(currency_out_id).price.to_f 

        currency_output = Currency.sell_calculator(currency_output)

        output = (value_input.to_f * currency_input) / currency_output
        
      end
    end

end
