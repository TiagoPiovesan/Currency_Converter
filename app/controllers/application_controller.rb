class ApplicationController < ActionController::Base
  before_action :set_currencies
  # permissão pundit
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  @currencies = Currency.all

  Search_currency


# autorização devise
  before_action :authenticate_user!

  layout :layout_by_resource

  protected

    def user_not_authorized
      flash[:alert] = "Você não está autorizado para executar está ação."
      redirect_to(request.referrer || root_path)
    end

    def layout_by_resource
      if devise_controller?
        "devise_layout"
      else
        "application"
      end
    end

    def set_currencies
      @currencies = Currency.all
    end
    
end
