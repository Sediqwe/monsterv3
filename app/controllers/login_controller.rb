class LoginController < ApplicationController
  #belépés panel megnyitása
  def login    
  end
  #regisztrációs panel megnyitása
  def registration
    @user = User.new    
  end
  #új felhasználó létrehozása
  def create
    @user = User.create(user_params)
    if @user.save
     redirect_to login_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to registration_path
    end
  end
   
  #Kijelentkezés a sessionból
  def signout
    session[:user_id] = nil
    redirect_to root_url, notice: "Kilépés OK!"
  end

  private
  def user_params
   params.require(:user).permit(:name, :password, :password_confirmation, :email, :alias)
  end

end
