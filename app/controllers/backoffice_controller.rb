class BackofficeController < ApplicationController
  layout "backoffice"

  before_action :set_currencies

  before_action :authenticate_user!


  private

    def set_currencies
      @currencies = Currency.all
    end
    
end
