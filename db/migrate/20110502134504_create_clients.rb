class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string    :title, :limit => 100, :null => false
      t.string    :email, :limit => 100, :null => false

      t.timestamps
    end

    add_index :clients, :email, :unique => true
  end

  def self.down
    drop_table :clients
  end
end

