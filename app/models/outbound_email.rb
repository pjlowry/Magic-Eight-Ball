class OutboundEmail < ActiveRecord::Base

  validates :to, :from, :subject, :text, :inbound_email_id, :presence => true

  attr_accessible :to, :from, :subject, :text, :inbound_email_id

  belongs_to :inbound_email

  def initialize(attributes) #may need work

    @from = 'answer@magic8.com'
    @to = attributes[:sender]
    @subject = attributes[:subject]
    @text = attributes[:'stripped-text']

    send_it
  end

  private

  def send_it #needs work
    faraday_response = Faraday.post do |request|
      request.url "https://api.mailgun.net/v2/play.epicodus.com.mailgun.org/messages"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64("api:#{API_KEY}")
      request.body = URI.encode_www_form(:from => @from, :to => @to, :subject => @subject, :text => @text)
  end

end