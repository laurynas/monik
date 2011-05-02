class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string    :title, :limit => 100, :null => false
      t.string    :token, :limit => 32, :null => false
      t.datetime  :last_entry_at
      t.integer   :alert_delay, :null => false, :default => 2.days.to_i

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end

