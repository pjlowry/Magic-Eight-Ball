class InboundEmail < ActiveRecord::Base

  validates :sender, :subject, :'stripped-text', :presence => true

  attr_accessible :sender, :subject, :'stripped-text'
  
end