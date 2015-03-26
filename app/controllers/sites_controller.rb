class SitesController < ApplicationController
  before_action :authenticate_admin!
 
  def index
    @sites = Site.all
    if request.xhr?
      render partial: 'sites_table', locals: {sites: @sites}
    end
  end

  def show
    redirect_to Site.find(params[:id]).url
  end
  
  def destroy
    Site.find(params[:id]).destroy
    redirect_to currencies_path, notice: 'Site is no longer watched.'     
  end
end

