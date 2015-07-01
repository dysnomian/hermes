describe LuhnCheck do
  describe ".valid?" do
    context 'with a Luhn valid number' do
      let(:number) { 4111111111111111 }

      it 'returns true' do
        expect(LuhnCheck.valid?(number)).to be_truthy
      end
    end

    context 'with a Luhn invalid number' do
      let(:number) { 12345 }

      it 'returns false' do
        expect(LuhnCheck.valid?(number)).to be_falsey
      end
    end
  end
end
