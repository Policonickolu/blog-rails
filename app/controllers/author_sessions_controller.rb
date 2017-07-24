class AuthorSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Connexion réussie.')
    else
      flash.now.alert = "Connexion échouée."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Déconnecté !')
  end

end
