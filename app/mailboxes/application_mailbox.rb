class ApplicationMailbox < ActionMailbox::Base
  routing (/^replies@/i) => :inbox
end
