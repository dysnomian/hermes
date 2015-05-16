describe AddUserTransaction do
  let(:transaction) { AddUserTransaction.new(params) }
  let(:params) do
    {
      account:     'Dipper',
      amount:      25,
      card_number: card_number
    }
  end
  let(:card_number)       { 4111111111111111 }

  describe '#apply' do
    subject        { transaction.apply(balances) }
    let(:balances)          { {} }

    context 'when the account does not exist' do
      let(:expected_balances) { { 'Dipper' => 25 } }

      it 'returns a balance hash with the account credited' do
        expect(subject).to eq(expected_balances)
      end
    end

    context 'when the account already exists' do
      let(:balances) { { 'Dipper' => 5 } }

      it 'returns the original balances' do
        expect(subject).to eq(balances)
      end
    end

    context 'when the card number is invalid' do
      let(:card_number)       { 123456789012345 }
      let(:expected_balances) { { 'Dipper' => nil } }

      it 'returns an nil balance' do
        expect(subject).to eq(expected_balances)
      end
    end
  end
end
