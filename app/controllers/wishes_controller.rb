class WishesController < ApplicationController
  # GET /wishes
  # GET /wishes.json

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
    @wishes = Wish.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishes }
    end
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
    @wish = Wish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish }
    end
  end

  # GET /wishes/new
  # GET /wishes/new.json
  def new
    @wish = Wish.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish }
    end
  end

  # GET /wishes/1/edit
  def edit
    @wish = Wish.find(params[:id])
  end

  # POST /wishes
  # POST /wishes.json
  def create
    
    @wish = current_user.wishes.build(params[:wish])
    if @wish.save
      flash[:success] = "Wish created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  # PUT /wishes/1
  # PUT /wishes/1.json
  def update
    @wish = Wish.find(params[:id])

    respond_to do |format|
      if @wish.update_attributes(params[:wish])
        format.html { redirect_to @wish, notice: 'Wish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
    redirect_to root_url
  end
end

  private
    def correct_user
      @wish = current_user.wishes.find_by_id(params[:id])
      redirect_to root_url if @wish.nil?
    end
