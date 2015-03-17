class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.all
     if request.xhr?
      render partial: 'main_table', locals: {currencies: @currencies}
    end
  end

  def show
    @currency = Currency.find(params[:id])
         if request.xhr?
      render partial: 'currency_table', locals: {currency: @currency}
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:name)
  end
end
