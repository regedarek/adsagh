class CategoriesController < ApplicationController
  
  layout :resolve_layout
  
  def index
    @roots = Category.where("ancestry IS NULL").order(:name)
    @categories = Category.arrange(:order=>:name)
    @categoria= Category.find_by_id(params[:category]).subtree.map(&:id) if params[:category]
    @ads = Ad.find(:all, :conditions => ["category_id IN (?)",@categoria])

  end
  

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, notice: t('.succesfully_created_category') 
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
      redirect_to categories_path, notice: t('.succesfully_updated_category') 
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, notice: t('.succesfully_destroyed_category') 
  end
end

private

def resolve_layout
 case params[:layout]
 when "minimalistic"
   "minimalistic"
 else
   "application"
 end
end
