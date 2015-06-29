require 'spec_helper'

describe Hermes do
  it 'has a version number' do
    expect(Hermes::VERSION).not_to be nil
  end

  describe '.run' do
    let(:filename) { 'spec/fixtures/spample.txt' }

    subject { Hermes.run(filename) }

    context 'when the file is valid' do
      let(:output) do
        "Dipper: error\n"\
          "Mabel: $3093.00\n"\
          "Soos: -$300.00\n"
      end

      before do
        allow(STDOUT).to receive(:puts).with(output)
      end
      it 'prints the expected output' do
        subject
        expect(STDOUT).to have_received(:puts).with(output)
      end
    end

    context 'when the file is improperly formatted' do

      before do
        Transaction.stub(:generate_from).and_raise(FormatError)
      end

      it 'produces the expected output' do
        expect(subject).to be_falsey
      end
    end
  end
end
