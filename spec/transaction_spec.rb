describe Transaction do
  describe '.generate_from' do
    subject { Transaction.generate_from(input_line) }

    let(:input_line)   { InputLine.new(input_string) }
    let(:input_string) { "Add #{account} 4111111111111111 $#{amount}" }
    let(:amount)       { 25 }
    let(:account)      { 'Mabel' }

    it 'sets the account name' do
      expect(subject.account).to eq(account)
    end

    it 'sets the amount' do
      expect(subject.amount).to eq(amount)
    end

    context 'when the operation is Add' do
      let(:input_string) { "Add #{account} 4111111111111111 $#{amount}" }

      it 'returns an AddUserTransaction' do
        expect(subject).to be_an(AddUserTransaction)
      end

      it 'has a card number' do
        expect(subject.card_number).to eq(4111111111111111)
      end
    end

    context 'when the operation is Credit' do
      let(:input_string) { "Credit #{account} $#{amount}" }

      it 'returns an CreditTransaction' do
        expect(subject).to be_a(CreditTransaction)
      end
    end

    context 'when the operation is Charge' do
      let(:input_string) { "Charge #{account} $#{amount}" }

      it 'returns an ChargeTransaction' do
        expect(subject).to be_a(ChargeTransaction)
      end
    end

    context 'when the operation name is invalid' do
      let(:input_string) { "Nonexistent #{account} $#{amount}" }

      it 'raises an FormatError' do
        expect { subject }.to raise_error(FormatError)
      end
    end

    context 'when the operation name is capitalized differently' do
      let(:input_string) { "CREDIT #{account} $#{amount}" }

      it 'interprets it correctly' do
        expect(subject).to be_a(CreditTransaction)
      end
    end
  end
end
