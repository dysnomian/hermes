describe 'InputLine' do
  describe '#to_a' do
    subject { InputLine.new(input_string).to_a }

    context 'when the input string starts with Add' do
      let(:input_string)  { 'Add Mabel 4111111111111111 $25' }

      context 'when the credit card is valid' do
        before { allow(LuhnCheck).to receive(:valid?).and_return true }
        let(:expected_array) { [true, :add, 'Mabel', 25] }

        it 'correctly formats add input array' do
          expect(subject).to eq(expected_array)
        end
      end

      context 'when the credit card is invalid' do
        before { allow(LuhnCheck).to receive(:valid?).and_return false }
        let(:expected_array) { [false, :add, 'Mabel', 25] }

        it 'correctly formats add input array' do
          expect(subject).to eq(expected_array)
        end
      end
    end

    context 'when the input string starts with Credit' do
      let(:input_string)  { 'Credit Dipper $25' }
      let(:expected_array) { [0, :credit, 'Dipper', 25] }

      it 'correctly formats Credit input array' do
        expect(subject).to eq(expected_array)
      end
    end
  end

  describe '#parse_amount' do
    subject { InputLine.new("").send(:parse_amount, amount) }

    context 'with a simple dollar amount' do
      let(:amount) { "$25" }

      it 'returns the dollar value without the dollar sign' do
        expect(subject).to eq(25)
      end
    end
  end
end

