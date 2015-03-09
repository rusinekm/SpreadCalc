class CurrenciesController < ApplicationController

  def index
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
