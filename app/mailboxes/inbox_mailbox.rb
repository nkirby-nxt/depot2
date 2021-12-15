class InboxMailbox < ApplicationMailbox
  def process
    case mail.subject
    when (/^\[\d*\]/i)
      # ok
    when (/^\[\w*\]/i)
      bounced!
    else
      raise "Invalid email subject"
    end
  end
end
