# Provides CRUD actions for +Author+ model.
class Admin::AuthorsController < Admin::ApplicationController

  before_action :author_params

  # Listes all authroes
  def index
    @authors = Author.all
  end

  # Shows an author
  def show
    @author = Author.find(params[:id])
  end

  # New author
  def new
    @author = Author.new
  end

  # Edit an existing author
  def edit
    @author = Author.find(params[:id])
  end

  # Create a new author from params
  def create
    @author = Author.new(params[:author])

    if @author.save
      redirect_to admin_author_path @author, notice: 'Author was successfully created.'
    else
      render action: "new"
    end
  end

  # Update an existing author from params
  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to admin_author_path @author, notice: 'Author was successfully updated.'
    else
      render action: "edit"
    end
  end

  # Delete an author
  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      redirect_to admin_authors_url
    else
      @authors = Author.all
      render "index" 
    end
  end

  private

    # Use strong_params
    def author_params
      params.require(:author).permit(:email, :name, :description, :gplus_profile)
    end
end
