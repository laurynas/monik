class Client < ActiveRecord::Base

  has_many :entries, :dependent => :delete_all

  validates :title, :length => { :minimum => 3, :maximum => 100 }
  validates :token, :presence => true, :uniqueness => true

  before_validation :generate_token, :on => :create

  attr_accessible :title, :alert_delay

  private

  def generate_token
    begin
      self.token = ActiveSupport::SecureRandom.hex(16)
    end while self.class.exists?( :token => self.token )
  end
end

