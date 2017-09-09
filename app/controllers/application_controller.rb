class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  Search_currency

  before_action :authenticate_user!
  
end
