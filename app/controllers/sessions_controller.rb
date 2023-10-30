class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "ログインしました。"
    else
      # ログイン失敗時の処理
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています。"
      render 'new'
    end
  end

  def destroy
    # ログアウト処理
    session[:user_id] = nil
    redirect_to new_sessions_path, notice: "ログアウトしました。"
  end

end

