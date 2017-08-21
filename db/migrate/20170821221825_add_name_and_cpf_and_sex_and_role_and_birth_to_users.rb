class AddNameAndCpfAndSexAndRoleAndBirthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :sex, :integer, default: 0
    add_column :users, :role, :boolean
    add_column :users, :birth, :date
  end
end
