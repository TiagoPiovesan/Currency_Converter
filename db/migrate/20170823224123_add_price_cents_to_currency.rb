class AddPriceCentsToCurrency < ActiveRecord::Migration
  def change
    add_column :currencies, :price_cents, :integer, default: 0
  end
end
