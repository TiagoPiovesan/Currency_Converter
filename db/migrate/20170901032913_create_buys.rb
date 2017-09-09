class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.references :user, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.decimal :value_input
      t.decimal :value_out
      t.references :currency_input, index: true, foreign_key: true
      t.references :currency_out, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
