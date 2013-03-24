#encoding: utf-8
class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = '欢迎来到四川理工订餐网'
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:successful] = "修改成功"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def signed_in_user
      redirect_to signin_path , notice: '请登陆' unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless currect_user?(@user)
    end
end
