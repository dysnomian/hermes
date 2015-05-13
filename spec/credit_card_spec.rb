describe CreditCard do
  describe '#valid?' do
    subject { CreditCard.new(cc).valid? }

    context 'when the card number is valid' do
      let(:cc) { 4111111111111111 }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    context 'when the card is invalid' do
      let(:cc) { 1234567890123456 }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end
end
