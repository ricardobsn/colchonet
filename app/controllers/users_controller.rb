class UsersController < ApplicationController
  # chama a view por default no users new (caso não especificado)

  def show
  @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # método create, o params q é o importante, caso de erro, ele faz reload da pag de criação
  def create
    @user = User.new(params[user_params])
    if @user.save
      redirect_to @user,
                  notice: 'Cadastro criado com sucesso!'
    else
      render action: :new
    end
  end

  private

  def user_params
    params.
      require(:user).
      permit(:email, :full_name, :location, :password, :password_confirmation, :bio)
  end
end
