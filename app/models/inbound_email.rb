class InboundEmail < ActiveRecord::Base

  validates :sender, :subject, :text, :presence => true

  attr_accessible :sender, :subject, :text

  has_one :outbound_email

  after_create :send_it 

  private

  def send_it
      OutboundEmail.create(:to => sender, :subject => subject, :text => text)
  end
end