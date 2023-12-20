class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    unless link_params[:target].start_with?("javascript")
      flash[:notice] = message
      redirect_to links_path and return
    end

    Link.create(link_params)

    redirect_to links_path
  end

  private

  def message
    '
    For this exercise please submit a JS injection like:
    javascript: (function() {
      var randomColor = Math.floor(Math.random()*16777215).toString(16);
      document.body.style.backgroundColor = "#" + randomColor;
    })();
    '
  end

  def link_params
    params.require(:link).permit(:target)
  end
end
