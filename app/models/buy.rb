class Buy < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :currency
end
