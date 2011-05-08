class Listener < ActiveRecord::Base
  belongs_to  :client
  has_many    :entries, :dependent => :delete_all

  scope :in_alert_mode, :conditions => [ "last_entry_at < ?::TIMESTAMP - (alert_delay||' seconds')::INTERVAL", Time.now ]

  validates :title, :length => { :minimum => 3, :maximum => 100 }
  validates :token, :presence => true, :uniqueness => true

  before_validation :generate_token, :on => :create

  attr_accessible :title, :alert_delay

  def to_s
    self.title
  end

  private

  def generate_token
    begin
      self.token = ActiveSupport::SecureRandom.hex(16)
    end while self.class.exists?( :token => self.token )
  end
end

