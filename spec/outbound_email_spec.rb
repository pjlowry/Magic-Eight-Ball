require 'spec_helper'

API_KEY = 'key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6'

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

  context 'callbacks' do
    it 'after an instance of the OutboundEmail is created, an outbound_email is sent' do
      stub = stub_request(:post, "https://api:key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6@api.mailgun.net/v2/magic8.mailgun.org/outbound_emails")
      outbound_email = OutboundEmail.create(:to => 'michael@epicodus.com', :from => 'a@b.com', :subject => 'hi', :text => 'testing 1,2,3')
      OutboundEmail.any_instance.stub(:send_it)
    end
  end

  # context '#initialize' do
  #   it 'creates an instance of outbound_email with an argument' do
  #     stub = stub_request(:post, "https://api:key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6@api.mailgun.net/v2/magic8.mailgun.org/outbound_emails").
  #        with(:body => {"from"=>"answer@magic8.com", "subject"=>"hello", "text"=>true, "to"=>true}).
  #        to_return(:status => 200)
  #     outbound_email = OutboundEmail.new(:from => 'me@icloud.com', :to => 'you@icould.com', :subject => 'hello', :text => 'test')
  #     outbound_email.should be_an_instance_of OutboundEmail
  #   end
  # end

  # context '#send_it' do
  #   it 'sends an email message using the Mailgun API' do
  #     stub = stub_request(:post, "https://api:key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6@api.mailgun.net/v2/magic8.mailgun.org/outbound_emails").
  #        with(:body => {"from"=>"answer@magic8.com", "subject"=>"hello", "text"=>true, "to"=>true}).
  #        to_return(:status => 200)
  #     outbound_email = OutboundEmail.new(:from => 'me@icloud.com', :to => 'you@icould.com', :subject => 'hello', :text => 'test')
  #     stub.should have_been_requested
  #   end
  # end


    # it 'sends a response email to the inbound mail sender' do 
    #   inbound_email = InboundEmail.new(:sender => 'a@b.com', :subject => 'hi', :'stripped-text' => 'testing 1,2,3')
    #   email_out = OutboundEmail.new(:recipient => inbound_email.sender, :inbound_email_id => 3, :sender => 'answer@magic8ball', :subject => "re: hi", :'stripped-text' => 'testing 1,2,3', :answer => 'chances are good')
    #   email_out.send_it.recipient.should eq 'a@b.com'
    # end
  # end
end

