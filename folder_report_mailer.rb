require_relative 'mailer'

class FolderReportMailer
  def initialize(folder_name, email)
    @folder_name = folder_name
    @recipient = email
    @report = ''
  end

  def generate_report!
    files = Dir.glob("#{@folder_name}/*", File::FNM_DOTMATCH)
    @report = files.map {
      |f| "- #{f}"
    }.join("\n")
  end

  def send_report
    Mailer.deliver(
      from: 'generator@example.com',
      to: @recipient,
      subject: 'File folder report',
      body: @report
    )
  end

  # This method only exists for demonstration purposes
  def simulate
    generate_report!
    send_report
  end
end
