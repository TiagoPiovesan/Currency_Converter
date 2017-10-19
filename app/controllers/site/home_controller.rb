class Site::HomeController < SiteController
  before_action :set_informations, only: [:index]

  def index

  end

  private

    def set_informations
      @users = User.all
      @company = Company.first
    end
end
