describe Register do
  let(:register) { Register.new(transactions: transactions) }

  let(:add_transaction) do
    AddUserTransaction.new(
      card_number: 4111111111111111,
      account:     'Mabel',
      amount:      25
    )
  end

  let(:add_transaction_2) do
    AddUserTransaction.new(
      card_number: 5454545454545454,
      account:     'Soos',
      amount:      3
    )
  end

  let(:invalid_add_transaction) do
    AddUserTransaction.new(
      card_number: 1234567890123456,
      account:     'Dipper',
      amount:      30000000000
    )
  end

  let(:credit_transaction) do
    CreditTransaction.new(
      account: 'Mabel',
      amount:  25
    )
  end

  let(:charge_transaction) do
    ChargeTransaction.new(
      account: 'Mabel',
      amount:  15
    )
  end

  let(:charge_transaction_2) do
    ChargeTransaction.new(
      account: 'Soos',
      amount:  15
    )
  end

  let(:transactions) do
    [add_transaction,
     add_transaction_2,
     invalid_add_transaction,
     credit_transaction,
     charge_transaction,
     charge_transaction_2]
  end

  describe '#apply_all' do
    subject { register.apply_all }

    let(:balances) do
      {
        'Mabel' => 35,
        'Soos' => -12,
        'Dipper' => nil
      }
    end

    it 'returns a balance hash with transactions applied' do
      expect(subject).to eq(balances)
    end
  end
end
