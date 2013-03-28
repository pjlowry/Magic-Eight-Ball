class OutboundEmail < ActiveRecord::Base

  validates :sender, :subject, :'stripped-text', :presence => true

  attr_accessible :sender, :subject, :'stripped-text'


    # to = {:to => "#{inbound_email.from}"}
    # from, subject, email_response


# private

#   def email_response
# RESPONSES = [""]
#     rand(RESPONSES)    
#   end



end