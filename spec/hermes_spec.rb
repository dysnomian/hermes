require 'spec_helper'

describe Hermes do
  it 'has a version number' do
    expect(Hermes::VERSION).not_to be nil
  end

  describe '.run' do
    let(:filename) { 'spec/fixtures/example_input.txt' }

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

      it 'produces the expected output' do
        expect(subject).to be_nil
      end
    end

    context 'when the file is invalid' do

      before do
        allow(Transaction).to receive(:generate_from).and_raise(FileFormatError)
      end

      let(:output) do
        "FileFormatError: Your input file doesn't appear to be formatted correctly.\n\n"\
        "#{filename}:\n"\
        "#{File.read(filename)}"
      end

      before do
        allow(STDOUT).to receive(:puts).with(output)
      end

      it 'prints the expected output' do
        subject
        expect(STDOUT).to have_received(:puts).with(output)
      end

      it 'produces the expected output' do
        expect(subject).to be_falsey
      end
    end
  end
end
