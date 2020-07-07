class Mailer
  def self.deliver(from:, to:, subject:, body:)
    puts "email sent to #{to}"
  end
end
