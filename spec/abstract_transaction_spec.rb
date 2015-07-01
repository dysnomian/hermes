describe AbstractTransaction do

  subject { AbstractTransaction.new(params) }
  let(:params) do
    {
      account: nil,
      amount: nil,
      card_number: nil
    }
  end

  describe '#apply' do
    it 'raises a NotImplementedError' do
      expect { subject.apply }.to raise_error(NotImplementedError)
    end
  end
end
