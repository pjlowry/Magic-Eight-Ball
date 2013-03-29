require 'spec_helper'

describe InboundEmailsController do
  context 'routing' do
    it {should route(:post, '/inbound_emails').to :action => :create}
  end

  context 'with valid parameters' do
    let(:valid_attributes) {{:sender => 'michael@epicodus.com', :subject => 'hi', :text => 'testing 1,2,3'}}
    let(:valid_parameters) {{:inbound_email => valid_attributes}}

    it 'creates a new email' do
      expect {post :create, valid_parameters}.to change(InboundEmail, :count).by(1)
    end

    before {post :create, valid_parameters}

      it {should respond_with 200}

  end
end