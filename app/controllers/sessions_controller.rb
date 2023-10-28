class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = createcurrent_user.id
      flash[:notice]= "ログインに成功しました"
      redirect_to root_path
    else
      flash[:alert]= "ログインに失敗しました"
      render action: "new"
    end
  end

  def destroy
    session[:user_id]=nill
    redirect_to new_sessions_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

