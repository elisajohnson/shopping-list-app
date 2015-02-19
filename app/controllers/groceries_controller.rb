class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def new
    @grocery = Grocery.new
  end

  def create
    @grocery = Grocery.new(grocery_params)

    if @grocery.save
      redirect_to groceries_path
    else
      redirect_to new_grocery_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @grocery = Grocery.find(params[:id])
    if @grocery.update_attributes(params.require(:grocery).permit(:groceries, :qty))
      redirect_to groceries_path
    else
      render 'edit'
    end
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    @grocery.destroy
  end

  private
    def grocery_params
      params.require(:grocery).permit(:groceries, :qty)
    end
end

