class Smser
  def initialize(from, to)
    @from = from,
    @to = to
  end

  def deliver(body:)
    puts "sms sent to #{@to}"
  end
end
