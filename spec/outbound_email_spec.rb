require 'spec_helper'

describe OutboundEmail do
  it {should validate_presence_of :to}
  it {should validate_presence_of :from}  
  it {should validate_presence_of :subject}
  it {should validate_presence_of :text}
  it {should validate_presence_of :inbound_email_id}


  it {should allow_mass_assignment_of :to}
  it {should allow_mass_assignment_of :from}  
  it {should allow_mass_assignment_of :subject}
  it {should allow_mass_assignment_of :text}
  it {should allow_mass_assignment_of :inbound_email_id}

  it {should belong_to :inbound_email}

  # context '#return_email' do
  #   it 'pulls sender value from inbound email address and assigns it as recipient for outbound email' do 
  #     inbound_email = InboundEmail.new(:sender => 'a@b.com', :subject => 'hi', :'stripped-text' => 'testing 1,2,3')
  #     email_out = OutboundEmail.new(:recipient => inbound_email.sender, :inbound_email_id => 3, :sender => 'answer@magic8ball', :subject => "re: hi", :'stripped-text' => 'testing 1,2,3', :answer => 'chances are good')
  #     email_out.format_return_email.recipient.should eq 'a@b.com'
  #   end
  # end
end