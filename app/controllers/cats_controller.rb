class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    cat = Cat.new(cat_params)
    cat.save!

    redirect_to cats_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end
