require 'spec_helper'

describe Hermes do
  it 'has a version number' do
    expect(Hermes::VERSION).not_to be nil
  end

  describe '.run' do
    before do
      allow(File).to receive(:readlines)
        .with('filename.txt').and_return(input)
    end

    let(:input) do
      ["Add Soos 4111111111111111 $1000\n",
        "Add Mabel 5454545454545454 $3000\n",
        "Add Dipper 1234567890123456 $2000\n",
        "Charge Soos $500\n",
        "Charge Soos $800\n",
        "Charge Mabel $7\n",
        "Credit Mabel $100\n",
        "Credit Dipper $200\n"]
    end

    subject { Hermes.run('filename.txt') }

    context 'when the file is valid' do
      let(:output) do
        "Dipper: error\n"\
          "Mabel: $3093\n"\
          "Soos: -$300\n"
      end

      it 'produces the expected output' do
        expect(subject).to eq(output)
      end
    end

    context 'when the file is improperly formatted' do
      let(:output) do
        "Dipper: error\n"\
          "Mabel: $3093\n"\
          "Soos: -$300\n"
      end

      it 'produces the expected output' do
        expect(subject).to eq(output)
      end
    end
  end
end
