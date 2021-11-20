require '../lib/io_interface'

RSpec.describe IOInterface do
  $stdin = File.open('../test/data.txt')

  describe '#input_value' do
    subject { IOInterface.new.input_value }
    it { is_expected.to eq 15 }
  end

  describe '#input_source_scale' do
    subject { IOInterface.new.input_source_scale }
    it { is_expected.to eq 'C' }
  end

  describe '#input_target_scale' do
    subject { IOInterface.new.input_target_scale('C') }
    it { is_expected.to eq 'F' }
  end

  describe '#check_exit' do
    subject { IOInterface.new.check_exit }
    it { is_expected.to eq true }
  end

  describe '#output_result' do
    subject { IOInterface.new.output_result(10) }
    it { is_expected.to eq nil }
  end
end