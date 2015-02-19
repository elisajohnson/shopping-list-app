class GroceriesController < ApplicationController
  def index
    # shows all of the groceries for the current user
    @groceries = Grocery.where(user_id: session['user_id'])
  end

  def new
    # allows the user to make a new grocery
    @grocery = Grocery.new
  end

  def create
    # allows the user to create a new grocery and save it
    @grocery = Grocery.new(grocery_params)
    if @grocery.save
      redirect_to groceries_path
    else
      # if the grocery cannot save it will redirect to the new grocery page
      redirect_to new_grocery_path
    end
  end

  def show
    # show 1 grocery item
    @grocery = Grocery.find(params[:id])
  end

  def edit
    # edit the grocery item
    @grocery = Grocery.find(params[:id])
  end

  def update
    # update the grocery item
    @grocery = Grocery.find(params[:id])
    if @grocery.update_attributes(params.require(:grocery).permit(:groceries, :qty))
      redirect_to groceries_path
    else
      # if it doesn't successfully update take user back to edit
      render 'edit'
    end
  end

  def destroy
    # delete a grocery item and redirect to the index
    @grocery = Grocery.find(params[:id])
    @grocery.destroy
    redirect_to groceries_path
  end

  private
    def grocery_params
      # allows only these parameters to be passed into the input fields
      params.require(:grocery).permit(:groceries, :qty, :user_id)
    end
end

