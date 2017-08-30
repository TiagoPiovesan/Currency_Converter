class AddPriceCentsToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :price, :decimal, precision: 6, scale: 6
  end
end
