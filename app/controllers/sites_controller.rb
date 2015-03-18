class SitesController < ApplicationController
  before_action :authenticate_admin!
 
  def index
    @sites = Site.all
    if request.xhr?
      render partial: 'sites_table', locals: {sites: @sites}
    end
  end

  def new
    @site = Site.new
    if request.xhr?
      render partial: 'new_site_form', locals: {site: @site}
    end
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to currencies_path
    else
      render :new
    end
  end

  def show
    redirect_to Site.find(params[:id]).url
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

