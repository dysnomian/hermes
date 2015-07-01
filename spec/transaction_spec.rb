describe Transaction do
  subject      { Transaction.new(name, change) }
  let(:name)   { 'Stan' }
  let(:change) { ->(balance) { balance + 5 } }

  describe '#to_hash' do
    let(:balance)       { 10 }
    let(:expected_hash) { { 'Stan' => 15 } }

    it 'returns a hash associating the name with the executed change' do
      expect(subject.to_hash(balance)).to eq(expected_hash)
    end
  end
end
