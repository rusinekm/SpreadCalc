class CreateStatNodes < ActiveRecord::Migration
  def change
    create_table :stat_nodes do |t|
      t.decimal :sell_value
      t.decimal :buy_value
      t.decimal :spread_value
      t.decimal :net_worth
      t.integer :site_id
      t.integer :currency_id
      t.timestamps
    end
  end
end
