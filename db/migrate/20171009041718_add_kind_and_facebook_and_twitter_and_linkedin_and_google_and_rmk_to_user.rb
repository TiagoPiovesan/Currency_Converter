class AddKindAndFacebookAndTwitterAndLinkedinAndGoogleAndRmkToUser < ActiveRecord::Migration
  def change
    add_column :users, :kind, :integer
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :google, :string
    add_column :users, :rmk, :string
  end
end
