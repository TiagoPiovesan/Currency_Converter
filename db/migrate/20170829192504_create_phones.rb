class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
