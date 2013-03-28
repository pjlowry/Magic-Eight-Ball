class InboundEmailsController < ApplicationController

   def create
    inbound_email = InboundEmail.new(params[:inbound_email])

    if inbound_email.save
      render :json => inbound_email, :status => :created
    else
      render :json => inbound_email.errors, :status => :unprocessable_entity
    end
  end
end
