class UsersController < ApplicationController
  before_action :set_user, only:  [:show, :edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @follower_users = @user.follower_users
    @following_users = @user.following_users
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'ユーザー情報を編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
    
  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end