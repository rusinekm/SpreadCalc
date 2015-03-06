class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find(params[:id])
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      redirect_to currencies_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def currency_params
    params.require(:currency).permit(:name)
  end
end
