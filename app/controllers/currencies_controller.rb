class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find(params[:id])
  end
end
