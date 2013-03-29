class OutboundEmail < ActiveRecord::Base

  validates :to, :from, :subject, :text, :inbound_email_id, :presence => true

  attr_accessible :to, :from, :subject, :text, :inbound_email_id

  belongs_to :inbound_email

  after_create :send_it

  # def initialize(attributes)

  #   @from = 'answer@magic8.com'
  #   @to = attributes[:sender]
  #   @subject = attributes[:subject]
  #   @text = attributes[:'stripped-text']

  #   send_it
  # end

  private

  def send_it
    p '*' * 88
    faraday_response = Faraday.post do |request|
      request.url "https://api:key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6@api.mailgun.net/v2/magic8.mailgun.org/outbound_emails"
      request.headers['Authorization'] = "Basic " + Base64.strict_encode64('api:key-51g8hs2i7emr7zn4wg0dfk8leg3o70b6')
      request.body = URI.encode_www_form(:from => from, :to => to, :subject => subject, :text => text)
    end
  end

end