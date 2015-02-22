class AddCurrencyClassColumnToCurrencySite < ActiveRecord::Migration
  def change
    add_column :currency_sites, :currency_class, :string
    add_column :currency_sites, :string, :string
  end
end
