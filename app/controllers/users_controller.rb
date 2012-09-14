class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  
  def new
  	@user = User.new
  end

  
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to before I die!"
  		redirect_to @user
  	else
  		render 'new'
  	end	
  end

  def edit
    @user = User.find(params[:id])
  end

end