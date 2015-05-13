require 'spec_helper'

describe Hermes do
  it 'has a version number' do
    expect(Hermes::VERSION).not_to be nil
  end

  describe '.run' do
    subject      { Hermes.run(input) }
    let(:filename) { "example.txt" }

    let(:input) do
      "Add Soos 4111111111111111 $1000\n"\
        "Add Mabel 5454545454545454 $3000\n"\
        "Add Dipper 1234567890123456 $2000\n"\
        "Charge Soos $500\n"\
        "Charge Soos $800\n"\
        "Charge Mabel $7\n"\
        "Credit Mabel $100\n"\
        "Credit Dipper $200\n"
    end

    let(:output) do
      "Mabel: $-93\n"\
        "Dipper: error\n"\
        "Soos: $500\n"
    end

    before { allow(File).to receive(:read).with(filename).and_return(input) }

    pending 'produces the expected output' do
      expect(subject).to eq(output)
    end
  end
end
