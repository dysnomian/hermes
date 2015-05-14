describe 'InputLine' do
  describe '#to_hash' do
    subject { InputLine.new(input_string).to_hash }

    context 'when the input string starts with Add' do
      let(:input_string) { 'Add Mabel 4111111111111111 $25' }
      let(:expected_hash) do
        {
          type:        :add,
          account:     'Mabel',
          card_number: 4111111111111111,
          amount:      25
        }
      end

      it 'correctly formats AddUser creation hashes' do
        expect(subject).to eq(expected_hash)
      end
    end

    context 'when the input string starts with Credit' do
      let(:input_string) { 'Credit Dipper $25' }
      let(:expected_hash) do
        {
          type:        :credit,
          account:     'Dipper',
          card_number: nil,
          amount:      25
        }
      end

      it 'correctly formats Credit creation hashes' do
        expect(subject).to eq(expected_hash)
      end
    end
  end
end
