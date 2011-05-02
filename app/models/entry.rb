class Entry < ActiveRecord::Base

  belongs_to :client

  validates :client_id, :presence => true

  after_create :touch_client

  protected

  def touch_client
    self.client.touch(:last_entry_at)
  end

end

