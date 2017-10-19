class CurrenciesController < BackofficeController
  before_action :set_currency, only: [:show, :destroy]
  before_action :set_currencies, :set_price_buy, :set_price_sell , only: [:index]


  # GET /currencies
  # GET /currencies.json
  def index
  end

  def atualizar
    Search_currency.inicializacao_de_buscas
    redirect_to currencies_path, notice: "Moedas atualizadas com sucesso!"
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to currencies_url, notice: 'Moeda apagada com sucesso!.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name)
    end

    def set_price_buy
      @currencies_buy = Currency.all
      @currencies_buy.each do |currency|
        currency.price = Currency.buy_calculator(currency.price)
      end
    end

    def set_price_sell
      @currencies_sell = Currency.all
      @currencies_sell.each do |currency|
        currency.price = Currency.sell_calculator(currency.price)
      end
    end

    def set_currencies
      @currencies = Currency.all
    end
end
