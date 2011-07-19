class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :tankmen do |t|
      t.string :name
      t.integer :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :tankmen
  end
end
