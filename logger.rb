require_relative 'mailer'
require_relative 'smser'

# Violation of the Open-Closed Principle in Ruby
class Logger
  def initialize(format, delivery)
    @format = format
    @delivery = delivery
  end

  def log(string)
    deliver format(string)
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

  def deliver(text)
    case @delivery
    when :email
      Mailer.deliver(
        from: 'emergency@example.com',
        to: 'admin@example.com',
        subject: 'Logger report',
        body: text
      )
    when :sms
      Smser.deliver(
        from: '+15017250604',
        to: '+15558675309',
        body: text
      )
    when :to_stdout
      STDOUT.write(text)
    else
      raise NotImplementedError
    end
  end
end

# logger = Logger.new(:raw, :sms)
# logger.log('Emergency error! Please fix me!')
