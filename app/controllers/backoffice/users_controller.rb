class Backoffice::UsersController < BackofficeController
  before_action :set_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to backoffice_users_path, notice: "O administrador #{@user.name} foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    senha = params[:user][:password]
    confirm_senha = params[:user][:password_confirmation]

    if senha.blank? && confirm_senha.blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(params_user)
      redirect_to backoffice_users_path, notice: "O administrador #{@user.name} foi atualizado!"
    else
      render :edit
    end
  end

  def destroy
    if @user.delete
      redirect_to backoffice_users_path, notice: "O administrado #{@user.email} foi apagado!"
    else
      render :index
    end
  end

  def show
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:email, 
                                 :password, 
                                 :password_confirmation, 
                                 :sex,
                                 :role, 
                                 :name, 
                                 :cpf, 
                                 :birth,
                                 phones_attributes: [:id, :number, :_destroy]
                                )
  end
end
