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

  # This method only exists for demonstration purposes
  def simulate
    generate_report!
  end
end
