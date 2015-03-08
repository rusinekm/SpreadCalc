class CurrenciesController < ApplicationController

  def index
    Currency.all.each do |currency| 
      statnodes = currency.last_statistics
      currency.find_average_value(statnodes)
      currency.set_best_value(statnodes)
    end
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find(params[:id])
  end

  private

  def currency_params
    params.require(:currency).permit(:name)
  end
end
