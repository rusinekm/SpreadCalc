class SitesController < ApplicationController

  def index
    @sites = Site.all
  end
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
    Site.find(params[:id]).destroy
    redirect_to currencies_path, notice: 'Site is no longer watched.'     
  end

  private

  def site_params
    params.require(:site).permit(:name, :url)
  end
end

