class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :client, :null => false
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end

