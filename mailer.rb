class Mailer
  def initialize(from, to, subject)
    @from = from,
    @to = to
    @subject = subject
  end

  def deliver(body:)
    puts "email sent to #{@to}"
  end
end
