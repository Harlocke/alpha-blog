class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]="Inicio de sesión correcto"
      redirect_to user_path(user)
    else
      flash.now[:danger]="Usuario o contraseña incorrectos"
      render 'new'
    end
  end  
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Has cerrado sesión"
    redirect_to root_path
  end  

end 