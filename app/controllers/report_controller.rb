class ReportController < ApplicationController
  before_action :set_currency
  before_action :set_sell, only: [:report_sell]
  before_action :set_buy, only: [:report_buy]

  def report_sell
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @sells = Sell.where("date(created_at) = ?", param_search)
    else
      @sells = Sell.all
    end
  end

  def report_buy
    @date_to_search = param_search

    if params[:search] and params[:search] != ''
      @buys = Buy.where("date(created_at) = ?", param_search)
    else
      @buys = Buy.all
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
end
