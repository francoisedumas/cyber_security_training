class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    target = link_params[:target].start_with?('www') ? "https://#{link_params[:target]}" : link_params[:target]
    Link.create(target:)

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:target)
  end
end
