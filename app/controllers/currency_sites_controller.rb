class CurrencySitesController < ApplicationController

  def new
    @currency_site = CurrencySite.new
  end

  def create
    currency_id = Currency.find_currency_id(currency_params[:currency_name].capitalize)
    unless CurrencySite.such_connection_exists?(currency_params[:site_id], currency_id)
      @currency_site = CurrencySite.new(currency_site_params, currency_id: currency_id)
      if @currency_site.save
        redirect_to currencies_path
      else
        render :new
      end
    else
      @currency_site = CurrencySite.new
      flash[:alert] = 'such connection already exists'
      render :new
    end
  end

  def destroy
  end

  private

  def currency_params
    params.require(:currency_site).permit(:buy_parsing_css, :sell_parsing_css, :currency_name, :site_id)
  end
end
