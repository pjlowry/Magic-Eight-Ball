require 'spec_helper'

describe OutboundEmail do
  it {should validate_presence_of :sender}
  it {should validate_presence_of :subject}
  it {should validate_presence_of :'stripped-text'}
  it {should allow_mass_assignment_of :sender}
  it {should allow_mass_assignment_of :subject}
  it {should allow_mass_assignment_of :'stripped-text'}

end