class SitesController < ApplicationController

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to currencies_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:name, :url)
  end
end

