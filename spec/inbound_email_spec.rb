require 'spec_helper'

describe InboundEmail do
  it {should validate_presence_of :sender}
  it {should validate_presence_of :subject}
  it {should validate_presence_of :text}
  it {should allow_mass_assignment_of :sender}
  it {should allow_mass_assignment_of :subject}
  it {should allow_mass_assignment_of :text}

  it {should have_one :outbound_email}

  context 'callbacks' do
    it 'after an instance of the InboundEmail is created, an outbound_email is created' do
      inbound_email = InboundEmail.new(:sender => 'michael@epicodus.com', :subject => 'hi', :text => 'testing 1,2,3')
      OutboundEmail.should_receive(:create)
      inbound_email.save
    end
  end
end