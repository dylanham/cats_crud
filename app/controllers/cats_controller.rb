class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]
  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:notice] = 'You have a new cat!'
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update
      flash[:notice] = 'Your cat has changed!'
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :breed, :owner)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end


end
