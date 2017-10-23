class BuysController < BackofficeController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_action :set_buy_pdf, only: [:export]
  before_action :set_information, only: [:edit, :new, :create, :update]
  before_action :set_all_price_buy, only: [:index, :show, :create, :update, :edit, :new]
  
  require './lib/generate_buy_pdf'
  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.all.page(params[:page]).per(30).order(id: :desc)
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    # calculando taxas + percentual

    @buy.value_out = calculation_buy

    respond_to do |format|
      if @buy.save
        # se salvar, então envie o email

        currency_input = Currency.find(@buy.currency_input_id).name
        currency_out   = Currency.find(@buy.currency_out_id).name

        SaleMailer.buy_email(

          current_user, 
          @buy.customer, 
          currency_input,
          currency_out,
          @buy.value_input,
          @buy.value_out,
          @buy.created_at

          ).deliver_now

      format.html { redirect_to @buy, notice: 'Compra Realizada com sucesso!' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    # calculando taxas + percentual
    @buy.value_out = calculation_buy

    respond_to do |format|
      if @buy.update(buy_params) 

        format.html { redirect_to @buy, notice: 'Compra alterada com sucesso!' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Compra apagada com sucesso!' }
      format.json { head :no_content }
    end
  end

  def export

    GeneratePdf::buy(@buy.user.name, 
                     @buy.customer.name, 
                     @buy.value_input, 
                     @buy.value_out, 
                     @buy.currency_input_id,
                     @buy.currency_out_id,
                     @buy.created_at, @buy.updated_at
                     )
    redirect_to "/pdf/compra_#{(DateTime.now).strftime('%d-%m-%y_%H-%M-%S')}.pdf"

  end

  private

    def set_all_price_buy
      @currencies_buy = Currency.all
      @currencies_buy.each do |currency|
        currency.price = Currency.buy_calculator(currency.price)
      end
    end


    def set_information
      @users = User.all
      @customers = Customer.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(
        :user_id, 
        :customer_id, 
        :value_input, 
        :currency_input_id, 
        :currency_out_id
      )
    end

    def set_buy_pdf
      @buy = Buy.find(params[:format])
    end

    def calculation_buy 
      Buy.calculate_output(
        params[:buy][:value_input], 
        params[:buy][:currency_input_id], 
        params[:buy][:currency_out_id]
      )
    end
end
