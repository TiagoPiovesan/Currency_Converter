class Company < ActiveRecord::Base
  has_one :address
  has_many :comments


  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
