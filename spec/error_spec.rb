describe Hermes::Error do
  subject { Hermes::Error.new(params) }

  describe '#to_s' do
    context 'with full details' do
      let(:params) do
        {
          name:     "NeutronFlowError",
          summary:  "Polarity reversed unexpectedly.",
          filename: "pertwee.txt",
          line:     17,
          text:     "this.is_the problematic_text"
        }
      end

      let(:output) do
        "NeutronFlowError: Polarity reversed unexpectedly.\n\n"\
          "pertwee.txt:17:\n"\
          "this.is_the problematic_text"
      end

      it 'builds the expected string' do
        subject.inspect
        expect(subject.to_s).to eq(output)
      end
    end
  end
end
