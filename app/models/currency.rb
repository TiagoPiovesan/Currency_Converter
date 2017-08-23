class Currency < ActiveRecord::Base
  monetize :price_cents
end
