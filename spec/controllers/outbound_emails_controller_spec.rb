require 'spec_helper'

describe OutboundEmailsController do
  context 'routing' do
    it {should route(:post, '/outbound_emails').to :action => :create}
  end

  context 'with valid parameters' do
    let(:valid_attributes) {{:sender => 'plowry@scu.edu', :subject => 'hi', :'stripped-text' => 'testing 1,2,3'}}
    let(:valid_parameters) {{:outbound_email => valid_attributes}}

    it 'creates a new email' do
      expect {post :create, valid_parameters}.to change(OutboundEmail, :count).by(1)
    end

    before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created email' do
        response.body.should eq OutboundEmail.find(JSON.parse(response.body)['outbound_email']['id']).to_json
    end

      context 'with invalid parameters' do
      let(:invalid_attributes) {{:sender => ''}}
      let(:invalid_parameters) {{:outbound_email => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq OutboundEmail.create(invalid_attributes).errors.to_json
      end
    end
  end
end
