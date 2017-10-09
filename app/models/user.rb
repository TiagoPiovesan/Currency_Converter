class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum sex: [:Feminino, :Masculino]
  enum kind: [:Gerente, :Funcionario, :SEO]

  #relações
  has_many :buy
  
  has_many :phones

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, length: { minimum: 2 }
  validates :name, :cpf, :sex, presence: true

  #Paperclip 
  has_attached_file :avatar, styles: { large: "270x270>", medium: "150x150>", thumb: "100x100>" }, default_url: "/img_default/perfil.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

