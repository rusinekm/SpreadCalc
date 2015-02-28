class CreateCurrencySites < ActiveRecord::Migration
  def change
    create_table :currency_sites do |t|
      t.integer :currency_id
      t.integer :site_id
      t.string :buy_parsing_css
      t.string :sell_parsing_css

      t.timestamps
    end
  end
end
