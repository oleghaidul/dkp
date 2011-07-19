class AddColumnToTankman < ActiveRecord::Migration
  def self.up
    add_column :tankmen, :post_id, :integer
  end

  def self.down
    remove_column :tankmen, :post_id
  end
end
