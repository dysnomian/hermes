describe ChargeTransaction do
  let(:transaction) { ChargeTransaction.new(params) }
  let(:params) do
    {
      account: "Dipper",
      amount:  amount
    }
  end
  let(:amount) { 25 }

  describe '#apply' do
    subject { ChargeTransaction.new(params).apply(balances) }
    let(:balances) { { "Dipper" => balance } }

    context 'when there are sufficient funds' do
      let(:balance)           { amount + 5 }
      let(:expected_balances) { { "Dipper" => 5 } }

      it 'returns a balance hash with the account debited' do
        expect(subject).to eq(expected_balances)
      end
    end

    context 'when there are insufficient funds' do
      let(:balance) { amount - 1 }
      let(:expected_balances) { { "Dipper" => -1 } }

      it 'returns a negative balance' do
        expect(subject).to eq(expected_balances)
      end
    end

    context 'when the account does not exist' do
      let(:balances) { { "Paper Jam Dipper" => 25 } }
      let(:expected_balances) { balances }

      it 'returns the original balances' do
        expect(subject).to eq(balances)
      end
    end

    context 'when the account is in error (nil)' do
      let(:balances) do
        {
          "Paper Jam Dipper" => 25,
          "Dipper" => nil
        }
      end
      let(:expected_balances) { balances }

      it 'returns the original balances' do
        expect(subject).to eq(balances)
      end
    end
  end
end
