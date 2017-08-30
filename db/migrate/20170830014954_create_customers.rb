class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.integer :sex, default: 0
      t.date :birth

      t.timestamps null: false
    end
  end
end
