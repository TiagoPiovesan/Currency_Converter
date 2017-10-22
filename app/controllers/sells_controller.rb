class SellsController < BackofficeController
  before_action :set_sell, only: [:show, :edit, :update, :destroy]
  before_action :set_sell_pdf, only: [:export]
  before_action :set_information, only: [:edit, :new, :create, :update]
  before_action :set_price_sell, only: [:index, :show, :create, :update, :edit, :new]

  require './lib/generate_sell_pdf'

  # GET /sells
  # GET /sells.json
  def index
    @sells = Sell.all.page(params[:page]).per(30).order(id: :desc)
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
    new_out_value = calculation_sell

    @sell = Sell.new(sell_params)

    # atribuindo o calculo ao campo vazio
    @sell.value_out = new_out_value

    respond_to do |format|
      if @sell.save
        SaleMailer.sell_email(current_user, @sell.customer).deliver_now
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

  def export

    GeneratePdf::sell(
                      @sell.user.name, 
                      @sell.customer.name, 
                      @sell.value_input, 
                      @sell.value_out, 
                      @sell.currency_input_id,
                      @sell.currency_out_id,
                      @sell.created_at, @sell.updated_at
                      )

    redirect_to "/pdf/venda_#{(DateTime.now).strftime('%d-%m-%y_%H-%M-%S')}.pdf"

  end

  private

    def set_price_sell
      @currencies_sell = Currency.all
      @currencies_sell.each do |currency|
        currency.price = Currency.sell_calculator(currency.price)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    def set_sell_pdf
      @sell = Sell.find(params[:format])
    end

    def set_information
      @users = User.all
      @customers = Customer.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_params
      params.require(:sell).permit(
        :user_id, 
        :customer_id, 
        :value_input, 
        :currency_input_id, 
        :currency_out_id
      )
    end

    def calculation_sell
      value_input = params[:sell][:value_input]
      currency_input_id = params[:sell][:currency_input_id]
      currency_out_id = params[:sell][:currency_out_id]

      Sell.calculate_output(value_input, currency_input_id, currency_out_id)
    end
end
