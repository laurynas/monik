class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :listener, :null => false
      t.text :content

      t.timestamps
    end

    add_index :entries, :listener_id, :name => 'listener_id_idx'
  end

  def self.down
    drop_table :entries
  end
end

