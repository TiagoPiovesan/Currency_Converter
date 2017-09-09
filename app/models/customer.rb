class Customer < ActiveRecord::Base

  enum sex: [:Feminino, :Masculino]
  
  #relações
  belongs_to :buy
  
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
