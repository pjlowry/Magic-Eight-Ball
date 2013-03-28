class OutboundEmailsController < ApplicationController

  def create
    outbound_email = OutboundEmail.new(params[:outbound_email])

    if outbound_email.save
      render :json => outbound_email, :status => :created
    else
      render :json => outbound_email.errors, :status => :unprocessable_entity
    end
  end
end