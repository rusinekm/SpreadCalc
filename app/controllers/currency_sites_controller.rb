class CurrencySitesController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @currency_site = CurrencySite.new
    @site = Site.new
    @currency = Currency.new
    if request.xhr?
      render partial: 'new_currency_site_form', locals: {currency_site: @currency_site, site: @site, currency: @currency}
    end
  end

  def create

    puts params[:currency_site][:new_site] == "1"
    puts params[:currency_site][:new_currency] == "1"


    if params[:currency_site][:new_site] == "1"
      @site = Site.new(name: params[:currency_site][:site_name], url: params[:currency_site][:site_url]) 
      unless @site.save 
        @currency_site = CurrencySite.new
        flash[:alert] = @site.errors.full_messages.last
        render :new
        return
      end
    end

    if params[:currency_site][:new_currency] == "1"
      @currency = Currency.new(name: params[:currency_site][:currency_name]) 
      unless @currency.save 
        @currency_site = CurrencySite.new
        flash[:alert] = @site.errors.full_messages.last
        render :new
        return
      end
    end

    if params[:currency_site][:new_site] == "1"
      site_id = @site.id
    else
      site_id = params[:currency_site][:site_id]
    end

    if params[:currency_site][:new_currency] == "1"
      currency_id = @currency.id
    else
      currency_id = params[:currency_site][:currency_id]
    end

    unless CurrencySite.such_connection_exists?(site_id, currency_id)
      @currency_site = CurrencySite.new(buy_parsing_css: params[:currency_site][:buy_parsing_css], sell_parsing_css: params[:currency_site][:sell_parsing_css], currency_id: currency_id, site_id: site_id)
      if @currency_site.save
        redirect_to currencies_path
      else
        Currency.destroy_if_empty
        render :new
      end
    else
      @currency_site = CurrencySite.new
      Currency.destroy_if_empty
      flash[:alert] = "such association already exists"
      render :new
    end
  end

  def destroy
    CurrencySite.find(params[:id]).destroy
    Currency.destroy_if_empty
    Currency.find_best_values
    redirect_to currencies_path, notice: 'Currency is no longer watched on this site.'
  end
end