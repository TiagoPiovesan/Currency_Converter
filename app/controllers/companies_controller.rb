class CompaniesController < BackofficeController
  before_action :set_company, only: [:show, :edit, :update]
  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/1/edit
  def edit
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Configurações da empresa alteradas com sucesso!' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(
        :name, 
        :youtube,
        :twitter,
        :facebook,
        :google,
        :email,
        :about_us,
        address_attributes: [:state, :city, :zipcode, :neighborhood,:street, :number])
    end
end
