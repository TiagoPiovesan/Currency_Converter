class AddEmailAndYoutubeAndFacebookAndGoogleAndTwitterToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :email, :string
    add_column :companies, :youtube, :string
    add_column :companies, :facebook, :string
    add_column :companies, :google, :string
    add_column :companies, :twitter, :string
  end
end
