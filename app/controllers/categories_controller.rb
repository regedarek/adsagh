class CategoriesController < ApplicationController
  def index
    @roots = Category.where("ancestry IS NULL")
    @categories = Category.arrange(:order=>:created_at)
  end
  

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, :notice => "Successfully destroyed category."
  end
end
