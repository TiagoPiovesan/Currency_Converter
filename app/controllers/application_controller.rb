class ApplicationController < ActionController::Base
  # permissão pundit
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  @currencies = Currency.all

  Search_currency

# autorização devise
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
end
