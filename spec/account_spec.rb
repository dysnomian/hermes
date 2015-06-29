require 'spec_helper'

describe Account do
  let(:account)     { Account.new(params) }
  let(:params) do
    { credit_card: credit_card, balance: balance, name: name }
  end

  let(:credit_card) { '4111111111111111' }
  let(:balance)     { 1.5 }
  let(:name)        { 'Stan' }

  describe '#initialize' do
    it 'initializes with a balance' do
      expect(account.balance).to eq(balance)
    end

    it 'initializes with a card' do
      expect(account.credit_card).to eq(credit_card)
    end

    it 'initializes with a name' do
      expect(account.name).to eq(name)
    end
  end

  describe '#credit' do
    subject       { account.credit(amount) }
    let(:balance) { 1.5 }
    let(:amount)  { 1.5 }

    it 'adds the credited amount to the account' do
      expect(subject).to eq(3.0)
    end
  end

  describe '#charge' do
    subject       { account.charge(amount) }
    let(:balance) { 1.5 }
    let(:amount)  { 1.5 }

    it 'debits the amount to the account' do
      expect(subject).to eq(0)
    end
  end


  describe '#valid?' do
    context 'when the card is valid' do
      subject           { Account.new(credit_card: '4111111111111111').valid? }

      it 'returns a truthy value' do
        expect(subject).to be_truthy
      end
    end

    context 'when the card is invalid' do
      subject           { Account.new(credit_card: '1235').valid? }

      it 'returns a falsey value' do
        expect(subject).to be_falsey
      end
    end
  end
end
