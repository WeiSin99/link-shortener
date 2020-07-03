class LinksController < ApplicationController

  def new
    @link = Link.new
    @links = Link.all
  end

  def show
    @link = Link.find_by(shortened_link: params[:shortened_link])
    redirect_to @link.original_link
    debugger
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "#{root_url}#{@link.shortened_link}"
      redirect_to root_path
    else
      flash[:danger] = "This is not a valid url"
      redirect_to root_path
    end
  end

  private

    def link_params
      params.require(:link).permit(:original_link)
    end
end
