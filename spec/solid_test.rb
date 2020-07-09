require_relative '../folder_report_mailer'
require_relative '../logger'
require_relative '../user_statistic'
require_relative '../user'
require_relative '../post'
require_relative '../coffee_machine'
require_relative '../printer'
require 'rspec'

RSpec.describe 'SOLID' do
  context 'Single Responsibility Principle' do
    let(:frm) do
      FolderReportMailer.new('/usr/local/bin', 'someguy@mailinator.com')
    end

    it 'should only do one thing' do
      expect(frm).to receive(:generate_report!)
      expect(frm).to_not respond_to(:send_report)

      frm.simulate
    end
  end

  context 'Open-Closed Principle' do
    # Slack intentionally doesn't exist yet, think how you can add it
    # tip: You'll probably have to change this initialization as well
    let(:logger) { Logger.new(:raw, :slack) }

    it 'means a class should be open for extension but closed for modification' do
      # the actual logger object should not implement the deliver method in OCP
      expect(logger).to_not receive(:deliver)

      logger.log 'Hello darkness, my old friend'
    end
  end

  context 'Liskov Substitution Principle' do
    let(:posts) do
      [
        Post.new('John Doe', false, 'The first post'),
        Post.new('Jane Doe', true, 'The second post')
      ]
    end
    let(:user) { User.new(posts) }
    let(:child_class) { AdminStatistic.new(user) }
    let(:parent_class) { UserStatistic.new(user) }

    it 'means parent instances should be replaceable with its children without
     modifying the type of data returned' do
      expect(parent_class.posts).to eq(posts)
      expect(child_class.posts).to eq(posts.select(&:popular?))
    end
  end

  context 'Interface Segregation Principle' do
    let(:person) { Person.new }
    let(:staff) { Staff.new }

    it 'means you should segregate the interfaces according to responsibilities' do
      person_coffee_machine = person.instance_variable_get(:@coffee_machine)
      staff_coffee_machine = staff.instance_variable_get(:@coffee_machine)

      expect(person_coffee_machine).to_not be_a(CoffeeMachineInterface)
      expect(staff_coffee_machine).to_not be_a(CoffeeMachineInterface)
    end
  end

  context 'Dependency Inversion Principle' do
    let(:data) { { msg: 'this is an example of dip' } }
    let(:printer) { Printer.new(data) }
    let(:formatter) { PdfFormatter.new }
    before do
      allow(formatter).to receive(:format)
      printer.should_receive(:print).with(hash_including(formatter: formatter)).and_call_original
    end
    it 'means high-level modules shouldn\'t depend on low-level modules' do
      expect(formatter).to receive(:format)
    end
    after { printer.print(formatter: formatter) }
  end
end
