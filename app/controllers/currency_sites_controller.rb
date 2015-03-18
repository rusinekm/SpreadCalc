class CurrencySitesController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @currency_site = CurrencySite.new
    if request.xhr?
      render partial: 'new_currency_site_form', locals: {currency_site: @currency_site}
    end
  end

  def create
    currency_id = Currency.find_currency_id(currency_params[:currency_name])
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

    CurrencySite.find(params[:id]).destroy
    Currency.destroy_if_empty
    Currency.find_best_values
    redirect_to currencies_path, notice: 'Currency is no longer watched on this site.'
  end

  private

  def currency_params
    params.require(:currency_site).permit(:buy_parsing_css, :sell_parsing_css, :currency_name, :site_id)
  end
end
