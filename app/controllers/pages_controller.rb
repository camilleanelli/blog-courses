class PagesController < ApplicationController
  before_action :set_page, except: [:index, :new, :create]
  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params_page)
    @page.save
    redirect_to pages_path
  end

  def edit
  end

  def update
    @page.update(params_page)
    redirect_to @page
  end

  def destroy
    @page.destroy
    redirect_to '/pages'
  end

private

  def params_page
    params.require(:page).permit(:title, :body, :slug)
  end

  def set_page
    @page = Page.find(params[:id])
  end

end
