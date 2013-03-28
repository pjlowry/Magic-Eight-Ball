require 'spec_helper'

describe InboundEmailsController do
  context 'routing' do
    it {should route(:post, '/inbound_emails').to :action => :create}
  end

  context 'with valid parameters' do
    let(:valid_attributes) {{:sender => 'michael@epicodus.com', :subject => 'hi', :'stripped-text' => 'testing 1,2,3'}}
    let(:valid_parameters) {{:inbound_email => valid_attributes}}

    it 'creates a new email' do
      expect {post :create, valid_parameters}.to change(InboundEmail, :count).by(1)
    end

    before {post :create, valid_parameters}

      it {should respond_with 201}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the newly-created email' do
        response.body.should eq InboundEmail.find(JSON.parse(response.body)['inbound_email']['id']).to_json
    end

      context 'with invalid parameters' do
      let(:invalid_attributes) {{:sender => ''}}
      let(:invalid_parameters) {{:inbound_email => invalid_attributes}}

      before {post :create, invalid_parameters}

      it {should respond_with 422}
      it {should respond_with_content_type :json}
      it 'responds with a json representation of the errors' do
        response.body.should eq InboundEmail.create(invalid_attributes).errors.to_json
      end
    end
  end
end