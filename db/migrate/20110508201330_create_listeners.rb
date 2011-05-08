class CreateListeners < ActiveRecord::Migration
  def self.up
    create_table :listeners do |t|
      t.references  :client, :null => false
      t.string      :title
      t.string      :token, :limit => 32, :null => false
      t.datetime    :last_entry_at
      t.integer     :alert_delay, :null => false, :default => 2.days.to_i

      t.timestamps
    end

    add_index :listeners, :client_id, :name => 'client_id_idx'
  end

  def self.down
    drop_table :listeners
  end
end

