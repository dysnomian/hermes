describe Register do
  let(:register) { Register.new(transactions) }

  let(:add_transaction) do
    double(
      account: 'Mabel',
      to_hash: { "Mabel" => 25 })
  end

  let(:error_transaction) do
    double(
      account: 'Stan',
      to_hash: { 'Stan' => nil })
  end

  let(:credit_transaction) do
    double(
      account: 'Mabel',
      to_hash: { 'Mabel' => 50 })
  end

  let(:charge_transaction) do
    double(
      account: 'Mabel',
      to_hash: { 'Mabel' => 40 })
  end


  let(:transactions) do
    [add_transaction,
     credit_transaction,
     charge_transaction,
     error_transaction]
  end

  describe '#account_balances' do
    subject { register.account_balances }

    let(:balances) do
      {
        'Mabel' => 40,
        'Stan'  => nil
      }
    end

    it 'returns a balance hash with transactions applied' do
      expect(subject).to eq(balances)
    end
  end
end
