class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :average_value
      t.integer :last_best_buy_statnode_id
      t.integer :last_best_sell_statnode_id
      t.timestamps
    end
  end
end
