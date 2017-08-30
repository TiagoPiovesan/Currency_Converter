class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :destroy]

  # GET /currencies
  # GET /currencies.json
  def index
    @currencies = Currency.all
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
end
