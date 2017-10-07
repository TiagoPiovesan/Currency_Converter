class ReportController < BackofficeController
  before_action :set_currency, :set_size
  before_action :set_sell, only: [:report_sell]
  before_action :set_buy, only: [:report_buy]

  def report_sell
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @sells = Sell.where("date(created_at) = ?", param_search)
      @amount = @sells.size
    else
      @sells = Sell.all.order(:created_at)
    end
  end

  def report_buy
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @buys = Buy.where("date(created_at) = ?", param_search)
      @amount = @buys.size
    else
      @buys = Buy.all.order(:created_at)
    end
  end

  private
  def param_search
    params[:search]
  end

  def set_sell
    @sells = Sell.all
  end

  def set_buy
    @buys = Buy.all
  end

  def set_currency
    @currencies = Currency.all
  end

  def set_size
    @amount = Buy.all.size
  end
end
