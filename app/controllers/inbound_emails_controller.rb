class InboundEmailsController < ApplicationController

  attr_reader :sender, :text, :subject

   def create
    @sender = params['sender']
    @text = params[:'stripped-text']
    @subject = params[:subject]
    inbound_email_hash = {:sender => @sender, :subject => @subject, :text => @text}
    inbound_email = InboundEmail.new(inbound_email_hash)
    
    
    inbound_email.save
    p inbound_email








in_note = InNote.new(params)
    in_note.respond
  end

end
