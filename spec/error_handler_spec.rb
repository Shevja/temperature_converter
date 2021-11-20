require './lib/error_handler'

RSpec.describe ErrorHanlder do
  describe '#check_value' do
    context 'Correct value' do
      subject { ErrorHanlder.new.check_value(5.5) }
      it { is_expected.to eq true }
    end

    context 'incorrect value' do
      subject { ErrorHanlder.new.check_value('test') }
      it { is_expected.to eq false }
    end
  end

  describe '#check_correct_scale' do
    context 'Correct temperature scale' do
      subject { ErrorHanlder.new.check_correct_scale('F') }
      it { is_expected.to eq true }
    end

    context 'Incorrect temperature scale' do
      subject { ErrorHanlder.new.check_correct_scale('test') }
      it { is_expected.to eq false }
    end
  end

  describe '#check_repeating_scale' do
    context 'Repeat scale' do
      subject { ErrorHanlder.new.check_repeating_scale('F', 'C') }
      it { is_expected.to eq true }
    end

    context 'Non-repeat scale' do
      subject { ErrorHanlder.new.check_repeating_scale('F', 'F') }
      it { is_expected.to eq false }
    end
  end
end
