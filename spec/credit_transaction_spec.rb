describe CreditTransaction do
  let(:transaction) { CreditTransaction.new(params) }
  let(:params) do
    {
      account: "Dipper",
      amount:  amount.to_i
    }
  end
  let(:amount) { 25 }

  describe '#apply' do
    subject        { transaction.apply(balances) }
    let(:balances) { { "Dipper" => 5 } }

    let(:expected_balances) { { "Dipper" => 30 } }

    it 'returns a balance hash with the account credited' do
      expect(subject).to eq(expected_balances)
    end

    context 'when the account does not exist' do
      let(:balances)          { { "Paper Jam Dipper" => 5 } }
      let(:expected_balances) { balances }

      it 'returns the original balances' do
        expect(subject).to eq(balances)
      end
    end

    context 'when the account balance is in error (nil)' do
      let(:balances) do
        {
          "Paper Jam Dipper" => 5,
          "Dipper"           => nil
        }
      end
      let(:expected_balances) { balances }

      it 'returns the original balances' do
        expect(subject).to eq(balances)
      end
    end

  end
end
