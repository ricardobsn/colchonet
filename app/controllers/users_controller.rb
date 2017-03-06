class UsersController < ApplicationController

# chama a view por default no users new (caso não especificado)
  def new
    @user = User.new
  end

  # método create o params q é o importante, caso de erro, ele faz reload da pag de criação
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user,
                  notice: 'Cadastro criado com sucesso!'
    else
      render action: :new
    end
  end
end
