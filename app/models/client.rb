class Client < ActiveRecord::Base

  has_many :listeners, :dependent => :destroy

  validates :title, :length => { :minimum => 3, :maximum => 100 }
  validates :email, :length => { :minimum => 3, :maximum => 100 }

  attr_accessible :title, :email

end

