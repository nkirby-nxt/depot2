require 'rails_helper'

RSpec.describe InboxMailbox, type: :mailbox do
  it "route email to proper mailbox" do
    expect(InboxMailbox).to receive_inbound_email(to: "replies@exampmle.com")
  end

  it "marks email as delievered when number tag in subject is valid" do 
    mail = Mail.new(
      from: "replies@example.com",
      subject: "[141982763] support ticket"
    )
    mail_processed = process(mail)
    expect(mail_processed).to have_been_delivered
  end

  it "marks email as bounced when number tag in subject is invalid" do
    mail = Mail.new(
      from: "replies@example.com",
      subject: "[111x] support ticket"
    )
    mail_processed = process(mail)
    expect(mail_processed).to have_bounced
  end

  it "marks email as failed when subject is invalid" do
    mail = Mail.new(
      from: "replies@example.com",
      subject: "INVALID"
    )
    expect {
      expect(process(mail)).to have_failed
    }.to raise_error(/Invalid email subject/)
  end
end
