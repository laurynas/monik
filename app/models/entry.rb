class Entry < ActiveRecord::Base

  belongs_to :listener

  validates :listener_id, :presence => true

  after_create :touch_listener

  protected

  def touch_listener
    self.listener.touch(:last_entry_at)
  end

end

