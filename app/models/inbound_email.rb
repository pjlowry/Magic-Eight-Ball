class InboundEmail < ActiveRecord::Base

  validates :sender, :subject, :'stripped-text', :presence => true

  attr_accessible :sender, :subject, :'stripped-text'

  has_one :outbound_email

  

end