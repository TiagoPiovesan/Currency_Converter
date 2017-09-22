class SellsController < ApplicationController
  before_action :set_sell, only: [:show, :edit, :update, :destroy]
  before_action :set_select_information, only: [:edit, :new]
  before_action :set_currency, only: [:index, :edit, :new, :show]
  before_action :set_all_price_sell, only: [:index, :show, :create, :update, :edit, :new]


  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
  end

  # GET /sells/new
  def new
    @sell = Sell.new
  end

  # GET /sells/1/edit
  def edit
  end

  # POST /sells
  # POST /sells.json
  def create
    # calculando taxas + percentual
    out_value = calculation_sell

    @sell = Sell.new(sell_params)
    @sell.value_out = out_value

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: 'Venda criada com sucesso.' }
        format.json { render :show, status: :created, location: @sell }
      else
        format.html { render :new }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    # calculando taxas + percentual
    out_value = calculation_sell
    @sell.value_out = out_value

    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'Venda alterada com sucesso!' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: 'Venda apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

      # % da Compra
    Value_in_sell = 1.02862
    # % do Imposto
    Value_tax = 1.011


    def set_all_price_sell
      @currencies = Currency.all
      @currencies.each do |currency|
        currency.price *= Value_in_sell
        currency.price *= Value_tax
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    def set_select_information
      @users = User.all
      @customers = Customer.all
    end


    def set_currency
      @currencies = Currency.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_params
      params.require(:sell).permit(:user_id, :customer_id, :value_input, :currency_input_id, :currency_out_id)
    end

    def calculation_sell
      value_input = params[:sell][:value_input]
      currency_input_id = params[:sell][:currency_input_id]
      currency_out_id = params[:sell][:currency_out_id]

      currency_input = @currencies.find(currency_input_id).price.to_f
      currency_output = @currencies.find(currency_out_id).price.to_f 

      currency_output *= Value_in_sell
      currency_output *= Value_tax

      out_value = (value_input.to_f * currency_input) / currency_output
      out_value
    end
end
