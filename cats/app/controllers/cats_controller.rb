class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cats_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat
      render :edit
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cats_params)
      redirect_to cat_url(@cat)
    else
      raise 'You put the wrong stuff!!'
    end
  end

  private

  def cats_params
    params.require(:cats).permit(:birth_date, :color, :name, :sex, :description)
  end

end
