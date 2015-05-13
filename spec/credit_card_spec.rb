describe CreditCard do
  let(:card) { CreditCard.new(card_number) }

  describe "#valid?" do
    let(:policy) { CreditCardValidationPolicy }

    context "when card is invalid" do
      let(:card_number) { 1234567890123456 }

      it "returns false" do
        expect(card.valid?).to be_falsey
      end
    end

    context "when card is valid" do
      let(:card_number) { 4111111111111111 }

      it "returns true" do
        expect(card.valid?).to be_truthy
      end
    end
  end
end
