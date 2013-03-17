# coding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new#(params[:user])
  end
  
  def create
    @user = User.new(params.require(:user).permit(:email, :password))
    @user.email = params[:user][:email].downcase
    if @user.save
      #UserMailer.welcome_email(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Есть! Проверьте свою почту!"
    else
      respond_to do |format|
        format.html { render action: "new" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
