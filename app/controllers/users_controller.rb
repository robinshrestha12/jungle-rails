class UsersController < ApplicationController

  def new
  end

  def create
    
    if user_params[:password] != user_params[:password_confirmation]
      puts "--------------invalid password -----------"
      redirect_to '/signup'
    end
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
       # If user saves in the db successfully:
      #flash[:notice] = "Account created successfully!"
      redirect_to '/'
    else
      puts "--------------Signup Failed -----------"
      #flash[:notice] = "User exists"
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
