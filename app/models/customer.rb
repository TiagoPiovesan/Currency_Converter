class Customer < ActiveRecord::Base

  enum sex: [:Feminino, :Masculino]
  
  #relações
  has_many :phones

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
