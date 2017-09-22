class Customer < ActiveRecord::Base

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  enum sex: [:Feminino, :Masculino]
  
  #relações
  has_many :buy
  
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, length: { minimum: 2 }
  validates :name, :email, :birth, :cpf, :sex, presence: true
end
