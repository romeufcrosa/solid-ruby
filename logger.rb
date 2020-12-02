require_relative 'mailer'
require_relative 'smser'

# Violation of the Open-Closed Principle in Ruby
class Logger
  def initialize(format, delivery)
    @format = format
    @delivery = delivery
  end

  def log(string)
    @delivery.deliver(body: format(string))
  end

  private

  def format(string)
    case @format
    when :raw
      string
    when :with_date
      "#{Time.now} #{string}"
    when :with_date_and_details
      "Log was created at #{Time.now}, Details: #{string}"
    else
      raise NotImplementedError
    end
  end
end

# logger = Logger.new(:raw, :sms)
# logger.log('Emergency error! Please fix me!')
