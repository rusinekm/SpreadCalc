class AddSiteIdColumnToStatNode < ActiveRecord::Migration
  def change
    add_column :stat_nodes, :site_id, :integer
  end
end
