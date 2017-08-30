class Phone < ActiveRecord::Base
  #relações
  belongs_to :user
  belongs_to :customer
end
