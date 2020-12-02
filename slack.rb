class Slack
  def initialize(from, to)
    @from = from,
    @to = to
  end

  def deliver(body:)
    puts "Slack message sent to #{@to}"
  end
end
