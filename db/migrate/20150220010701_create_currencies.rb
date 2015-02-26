class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name
      t.decimal :average_value
      t.timestamps
    end
  end
end
