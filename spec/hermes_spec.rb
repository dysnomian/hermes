require 'spec_helper'

describe Hermes do
  describe '.run' do
    let(:filename) { 'spec/fixtures/example_input.txt' }

    subject { Hermes.run(filename) }

    context 'when the file is valid' do
      let(:output) do
        "Dipper: error\n"\
          "Mabel: $3093\n"\
          "Soos: -$300\n"
      end

      before do
        allow(STDOUT).to receive(:puts).with(output)
      end

      it 'prints the expected output' do
        subject
        expect(STDOUT).to have_received(:puts).with(output)
      end
    end
  end
end
