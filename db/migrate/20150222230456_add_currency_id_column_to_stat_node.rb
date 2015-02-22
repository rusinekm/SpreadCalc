class AddCurrencyIdColumnToStatNode < ActiveRecord::Migration
  def change
    add_column :stat_nodes, :currency_id, :integer
  end
end
