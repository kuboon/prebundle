require 'aruba/rspec'

RSpec.describe Prebundle, type: :aruba do
  describe 'version' do
    subject { run_command('prebundle version') }
    it { is_expected.to be_successfully_executed }
    it { is_expected.to have_output(Prebundle::VERSION) }
  end
  describe "gem pg" do
    subject do
      run_command('prebundle gem pg')
      stop_all_commands
      last_command_started 
    end
    it { expect(subject.stdout.lines[0]).to eq "apt install -y libpq-dev\n" }
  end
end
