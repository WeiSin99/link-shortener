class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save

    else
      redirect_to root_path
    end
  end

  private

    def link_params
      params.require(:link).permit(:original_link)
    end
end
